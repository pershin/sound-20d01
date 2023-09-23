/* 
 * File:   sd.h
 * Author: Sergey
 *
 * Created on September 20, 2023, 7:09 PM
 */

#ifndef SD_H
#define SD_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

    int sd_init(void);
    void sd_deinit(void);
    int sd_read(uint32_t sector, void *buffer);
    int sd_read_blocks(uint32_t sector, void *buffer, uint8_t count);
    int sd_write(uint32_t sector, void *buffer);
    int sd_write_blocks(uint32_t sector, void *buffer, uint8_t count);

#ifdef __cplusplus
}
#endif

#endif /* SD_H */

