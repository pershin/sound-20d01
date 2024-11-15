/*
 * File:   main.c
 * Author: Sergey
 *
 * Created on September 17, 2023, 12:55 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include "sd.h"
#include "../../firmware/Sound-20D01MB_Player/Drivers/BSP/Sound-20D01/Inc/fs.h"

char *dev_path = NULL;

FS_structure *fs_init_new(void);
void fs_format(FS_structure *fs);
int fs_update(FS_structure *fs);
int fs_add_file(char *filename, char *title, FS_structure *fs);
void fs_deinit(FS_structure *fs);
uint16_t fs_read_block(uint8_t *buffer);

void ls(FS_structure *fs) {
    FS_TRACK_structure *track;
    int i;

    printf("Number Of Tracks: %d\n\n", fs->NumberOfTracks);

    track = malloc(sizeof (FS_TRACK_structure));
    if (NULL == track) {
        fprintf(stderr, "Insufficient memory available\n");
        return;
    }

    printf("| TRACK | TITLE                                                            | DURATION |\n");
    printf("|-------|------------------------------------------------------------------|----------|\n");

    for (i = 1; fs->NumberOfTracks >= i; i++) {
        sd_read(i, track);

        printf("| %5d | %-64s | ", i, track->Title);
        print_bcd_time(track->Minutes, track->Seconds);
        printf(" |\n");
    }

    free(track);
}

void extract_track(uint16_t track_number, char *filename) {
    FILE *stream;
    uint16_t numread;
    uint8_t buffer[CLUSTER_SIZE];

    fs_open(track_number);
    stream = fopen(filename, "wb");

    for (;;) {
        /*numread = fs_read(buffer);*/
        numread = fs_read_block(buffer);
        if (numread <= 0) {
            break;
        }

        fwrite(buffer, sizeof (uint8_t), numread, stream);
    }

    fclose(stream);
}

int main(int argc, char **argv) {
    FS_structure *fs;
    int c;
    static int format_flag;
    static int add_flag = 0;
    static int ls_flag = 0;
    int option_index = 0;
    static struct option long_options[] = {
        {"format", no_argument, &format_flag, 1},
        {"list", no_argument, &ls_flag, 1},
        {"add", required_argument, 0, 'a'},
        {"title", required_argument, 0, 't'},
        {0, 0, 0, 0}
    };
    char *filename;
    char filename_out[256];
    char *title;
    int o = 0;

    for (;;) {
        c = getopt_long(argc, argv, "a:t:o:p:", long_options, &option_index);

        /* Detect the end of the options. */
        if (-1 == c) {
            break;
        }

        switch (c) {
            case 0:
                /* If this option set a flag, do nothing else now. */
                if (long_options[option_index].flag != 0)
                    break;
                printf("option %s", long_options[option_index].name);
                if (optarg)
                    printf(" with arg %s", optarg);
                printf("\n");
                break;

            case 'a':
                add_flag = 1;
                filename = optarg;
                break;

            case 't':
                title = optarg;
                break;

            case 'p':
                dev_path = optarg;
                break;

            case 'o':
                o = atoi(optarg);
                break;

            case '?':
                /* getopt_long already printed an error message. */
                break;

            default:
                abort();
        }
    }

    if (NULL == dev_path) {
        fprintf(stderr, "Error dev_path!\n");
        return (EXIT_FAILURE);
    }

    /* Print any remaining command line arguments (not options). */
    if (optind < argc) {
        printf("non-option ARGV-elements: ");

        while (optind < argc) {
            printf("%s ", argv[optind++]);
        }

        putchar('\n');
    }

    fs = fs_init_new();
    if (NULL == fs) {
        return 1;
    }

    /*
        printf("FS_structure: %d\n", sizeof (FS_structure));
        printf("FS_TRACK_structure: %d\n", sizeof (FS_TRACK_structure));
     */

    if (format_flag) {
        char c;

        printf("Are you sure you want to format the disk (%s)? [y/N]\n", dev_path);

        c = getchar();
        if ('y' == c || 'Y' == c) {
            printf("Disk formatting...\n");
            fs_format(fs);
            fs_update(fs);
            printf("Disk formatting complete\n");
        }
    }

    if (ls_flag) {
        ls(fs);
    }

    if (add_flag) {
        if (0 == fs_add_file(filename, title, fs)) {
            fs_update(fs);
        }
    }

    if (0 < o) {
        snprintf(filename_out, 255, "/mnt/hdd/tmp/ramdisk/track%d.pcm", o);
        extract_track(o, filename_out);
    }

    fs_deinit(fs);

    return (EXIT_SUCCESS);
}
