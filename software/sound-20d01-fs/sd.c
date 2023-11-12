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
    __off64_t offset;

    offset = (__off64_t) sector;
    offset *= SECTOR_SIZE;

    pread64(fd, buffer, SECTOR_SIZE, offset);

    return 0;
}

int sd_read_blocks(uint32_t sector, void *buffer, uint8_t count) {
    __off64_t offset;
    size_t nbytes;

    offset = (__off64_t) sector;
    offset *= SECTOR_SIZE;
    nbytes = SECTOR_SIZE * count;

    pread64(fd, buffer, nbytes, offset);

    return 0;
}

int sd_write(uint32_t sector, void *buffer) {
    __off64_t offset;

    offset = (__off64_t) sector;
    offset *= SECTOR_SIZE;

    pwrite64(fd, buffer, SECTOR_SIZE, offset);

    return 0;
}

int sd_write_blocks(uint32_t sector, void *buffer, uint8_t count) {
    __off64_t offset;
    size_t nbytes;

    offset = (__off64_t) sector;
    offset *= SECTOR_SIZE;
    nbytes = SECTOR_SIZE * count;

    pwrite64(fd, buffer, nbytes, offset);

    return 0;
}
