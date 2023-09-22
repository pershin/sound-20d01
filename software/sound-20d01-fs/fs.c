#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <openssl/md5.h>
#include "sd.h"
#include "../../firmware/Sound-20D01MB_Player/Drivers/BSP/Sound-20D01/Inc/fs.h"

#define SECTOR_SIZE 512
#define FIRST_DATA_SECTOR 65536
#define SAMPLE_RATE 48000
#define CHANNELS 2

volatile uint32_t current_sector = 0;
volatile uint32_t last_sector = 0;
volatile uint16_t last_sector_size = 0;

void print_bcd_time(uint8_t minutes, uint8_t seconds) {
    char time_str[9] = "00:00:00";

    time_str[3] = (minutes >> 4) + 48;
    time_str[4] = (minutes & ~0b11110000) + 48;
    time_str[6] = (seconds >> 4) + 48;
    time_str[7] = (seconds & ~0b11110000) + 48;

    printf("%s", time_str);
}

void print_fs_info(FS_structure *fs) {
    char fs_name[9] = "";

    strncpy(fs_name, fs->FSName, 8);

    printf("FS INFO\n");
    printf("FS Name: %s\n", fs_name);
    printf("Version: %d\n", fs->Version);
    printf("Number Of Tracks: %d\n", fs->NumberOfTracks);
    printf("Next Free Sector: %d\n", fs->NextFreeSector);
}

void print_track_info(FS_TRACK_structure *track) {
    struct tm *created;
    char s[20];
    int i;

    printf("Title: %s\n", track->Title);
    printf("Duration: ");
    print_bcd_time(track->Minutes, track->Seconds);
    printf("\n");
    printf("First Sector: %u\n", track->FirstSector);
    printf("Last Sector: %u\n", track->LastSector);
    printf("Size: %u\n", track->Size);
    printf("Last Sector Size: %d\n", (int) track->LastSectorSize);

    /* Created */
    created = localtime(&track->Created);
    strftime(s, 20, "%d.%m.%Y %H:%M:%S", created);
    printf("Created: %s\n", s);

    /* Hash */
    printf("Hash: ");
    for (i = 0; MD5_DIGEST_LENGTH > i; i++) {
        printf("%02x", track->Hash[i]);
    }
    printf("\n");
}

uint8_t dec2bcd(uint8_t dec) {
    return ((dec / 10) << 4) | (dec % 10);
}

FS_structure *fs_init_new(void) {
    FS_structure *fs;

    if (0 != sd_init()) {
        fprintf(stderr, "Error: sd_init\n");
        return NULL;
    }

    fs = malloc(sizeof (FS_TRACK_structure));

    if (NULL == fs) {
        fprintf(stderr, "Insufficient memory available\n");
        return NULL;
    }

    sd_read(0, fs);

    return fs;
}

void fs_format(FS_structure *fs) {
    memset(fs, 0, sizeof (FS_structure));

    strncpy(fs->FSName, "FS-AUDIO", 8);
    fs->Version = 1;
    fs->NextFreeSector = FIRST_DATA_SECTOR;
}

void fs_deinit(FS_structure *fs) {
    free(fs);
    sd_deinit();
}

int fs_update(FS_structure *fs) {
    sd_write(0, fs);
    print_fs_info(fs);
    return 0;
}

int fs_add_file(char *filename, char *title, FS_structure *fs) {
    FS_TRACK_structure *track;
    FILE *stream;
    uint8_t buffer[SECTOR_SIZE];
    uint32_t numread, duration;
    MD5_CTX hMD5;

    track = malloc(sizeof (FS_TRACK_structure));

    if (NULL == track) {
        fprintf(stderr, "Insufficient memory available\n");
        return -1;
    }

    memset(track, 0, sizeof (FS_TRACK_structure));

    stream = fopen(filename, "rb");

    if (NULL == stream) {
        fprintf(stderr, "The file '%s' was not opened\n", filename);
        free(track);
        return -2;
    }

    track->Created = time(NULL);
    snprintf(track->Title, 255, title);

    MD5_Init(&hMD5);

    track->FirstSector = fs->NextFreeSector;
    track->LastSector = track->FirstSector - 1;

    for (;;) {
        memset(buffer, 0, SECTOR_SIZE);

        numread = fread(buffer, sizeof (uint8_t), SECTOR_SIZE, stream);
        if (numread <= 0) {
            break;
        }

        sd_write(++track->LastSector, buffer);

        track->Size += numread;
        track->LastSectorSize = numread;

        MD5_Update(&hMD5, buffer, numread);
    }

    fclose(stream);

    MD5_Final(track->Hash, &hMD5);

    fs->NextFreeSector = track->LastSector + 1;

    /* Duration */
    duration = track->Size / (SAMPLE_RATE * sizeof (uint16_t) * CHANNELS);
    track->Seconds = dec2bcd(duration % 60);
    track->Minutes = dec2bcd(duration / 60);

    sd_write(++fs->NumberOfTracks, track);

    printf("%d\n", fs->NumberOfTracks);
    print_track_info(track);
    printf("\n");

    free(track);
    
    return 0;
}

uint8_t fs_open(uint16_t track_number) {
    FS_TRACK_structure *track;

    track = malloc(sizeof (FS_TRACK_structure));

    if (NULL == track) {
        fprintf(stderr, "Insufficient memory available\n");
        return -1;
    }

    sd_read(track_number, track);

    current_sector = track->FirstSector;
    last_sector = track->LastSector;
    last_sector_size = track->LastSectorSize;

    print_track_info(track);

    free(track);

    return 0;
}

uint16_t fs_read(uint8_t *buffer) {
    uint16_t retval;

    if (current_sector > last_sector) {
        return 0;
    }

    if (current_sector == last_sector) {
        retval = last_sector_size;
    } else {
        retval = SECTOR_SIZE;
    }

    sd_read(current_sector++, buffer);

    return retval;
}
