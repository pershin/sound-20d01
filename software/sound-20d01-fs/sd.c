#include <stdio.h>
#include <fcntl.h>
#include "sd.h"

#define SECTOR_SIZE 512

extern char *dev_path;
int fd;

int sd_init(void) {
    fd = open(dev_path, O_RDWR);

    return -1 == fd ? 1 : 0;
}

void sd_deinit(void) {
    close(fd);
}

int sd_read(uint32_t sector, void *buffer) {
    lseek(fd, sector * SECTOR_SIZE, SEEK_SET);
    read(fd, buffer, SECTOR_SIZE);
    return 0;
}

int sd_read_blocks(uint32_t sector, void *buffer, uint8_t count) {
    lseek(fd, sector * SECTOR_SIZE, SEEK_SET);
    read(fd, buffer, SECTOR_SIZE * count);
    return 0;
}

int sd_write(uint32_t sector, void *buffer) {
    lseek(fd, sector * SECTOR_SIZE, SEEK_SET);
    write(fd, buffer, SECTOR_SIZE);
    return 0;
}

int sd_write_blocks(uint32_t sector, void *buffer, uint8_t count) {
    lseek(fd, sector * SECTOR_SIZE, SEEK_SET);
    write(fd, buffer, SECTOR_SIZE * count);
    return 0;
}
