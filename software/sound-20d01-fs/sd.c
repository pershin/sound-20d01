#include <stdio.h>
#include "sd.h"

#define SECTOR_SIZE 512

FILE *stream;

int sd_init(void) {
    stream = fopen("/mnt/hdd/tmp/ramdisk/data.bin", "rb+");
    if (NULL == stream) {
        return 1;
    }

    return 0;
}

void sd_deinit(void) {
    fclose(stream);
}

int sd_read(uint32_t sector, void *buffer) {
    fseek(stream, sector * SECTOR_SIZE, SEEK_SET);
    fread(buffer, SECTOR_SIZE, 1, stream);
    return 0;
}

int sd_write(uint32_t sector, void *buffer) {
    fseek(stream, sector * SECTOR_SIZE, SEEK_SET);
    fwrite(buffer, SECTOR_SIZE, 1, stream);
    return 0;
}
