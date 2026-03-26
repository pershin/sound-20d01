/*
 * File:   main.c
 * Author: Sergey
 *
 * Created on October 29, 2023, 7:04 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <getopt.h>
#include <signal.h>
#include <unistd.h>
#include "plac.h"
#include "encoder.h"
#include "decoder.h"
#include "player.h"
#include "wav.h"
#include "utils.h"

int verbose_flag = 0; /* Flag set by ‘--verbose’. */
int pcm_flag = 0; /* Flag set by ‘--pcm’. */
volatile int stop_flag = 0;

static bool decode(char *, char *);
static bool encode(char *, char *);
static int play(char *);
static void usage(char *);
static void signal_handler(int);

int main(int argc, char** argv) {
    int c, option_index;
    char *src_filename, *dest_filename;
    static int encode_flag, decode_flag, play_flag;

    static struct option long_options[] = {
        {"verbose", no_argument, &verbose_flag, 1},
        {"encode", required_argument, &encode_flag, 1},
        {"decode", required_argument, &decode_flag, 1},
        {"pcm", no_argument, &pcm_flag, 1},
        {"play", required_argument, &play_flag, 1},
        {0, 0, 0, 0}
    };

    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    dest_filename = NULL;

    for (;;) {
        option_index = 0;
        c = getopt_long(argc, argv, "o:", long_options, &option_index);

        /* Detect the end of the options. */
        if (c == -1) {
            break;
        }

        switch (c) {
            case 0:
                if (optarg) {
                    src_filename = optarg;
                }
                break;

            case 'o':
                dest_filename = optarg;
                break;

            case '?':
                break;

            default:
                abort();
        }
    }

    /* Print any remaining command line arguments (not options). */
    if (optind < argc) {
        printf("non-option ARGV-elements: ");
        while (optind < argc)
            printf("%s ", argv[optind++]);
        putchar('\n');
    }

    if (1 != encode_flag + decode_flag + play_flag) {
        usage(argv[0]);
        return EXIT_FAILURE;
    }

    if (encode_flag) {
        if (!encode(src_filename, dest_filename)) {
            return EXIT_FAILURE;
        }
    } else if (decode_flag) {
        if (!decode(src_filename, dest_filename)) {
            return EXIT_FAILURE;
        }
    }

    if (play_flag) {
        return play(src_filename);
    }

    return EXIT_SUCCESS;
}

static void signal_handler(int sig) {
    if (SIGINT == sig) {
        stop_flag = 1;
    }
}

static bool encode(char *src_filename, char *dest_filename) {
    FILE *src = NULL, *dest = NULL;
    WAVE_header *wav = NULL;
    int16_t *input = NULL;
    int i, numread, numwritten, best_mix_size, best_mix_num;
    long int src_size, dest_size;
    size_t bytes_left;
    bool result = false;

    input = malloc(PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == input) {
        fprintf(stderr, "Insufficient memory available\n");
        goto Cleanup;
    }

    src = fopen(src_filename, "r");
    if (NULL == src) {
        fprintf(stderr, "Cannot open file \"%s\"\n", src_filename);
        goto Cleanup;
    }

    wav = wav_header_read(src);
    if (NULL == wav) {
        fprintf(stderr, "Input file must be WAV format\n");
        goto Cleanup;
    }

    dest = fopen(dest_filename, "w");
    if (NULL == dest) {
        fprintf(stderr, "Cannot open file \"%s\"\n", dest_filename);
        goto Cleanup;
    }

    if (verbose_flag) {
        printf("Encoding...\n");
        printf("Input: %s\n", src_filename);
        printf("Output: %s\n", dest_filename);
    }

    dest_size = plac_header_write(dest);
    bytes_left = wav->data.Size;

    for (src_size = 0; bytes_left > 0;) {
        size_t to_read = PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t);

        if (to_read > bytes_left) {
            to_read = bytes_left;
        }

        numread = fread(input, sizeof (uint8_t), to_read, src);
        if (0 == numread) {
            break;
        }

        bytes_left -= numread;
        best_mix_size = 0;
        best_mix_num = 0;

        for (i = 0; 5 > i; i++) {
            numwritten = encoder_encode(input, numread, i, NULL);

            if (0 == i) {
                best_mix_size = numwritten;
                best_mix_num = i;
            } else {
                if (best_mix_size > numwritten) {
                    best_mix_size = numwritten;
                    best_mix_num = i;
                }
            }
        }

        numwritten = encoder_encode(input, numread, best_mix_num, dest);

        src_size += numread;
        dest_size += numwritten;
    }

    if (verbose_flag) {
        printf("Input Size:  %ld\n", src_size);
        printf("Output Size: %ld\n", dest_size);
        printf("Delta:       %ld\n", dest_size - src_size);
    }

    result = true;

Cleanup:
    if (wav) {
        free(wav);
    }

    if (input) {
        free(input);
    }

    if (src) {
        fclose(src);
    }

    if (dest) {
        fclose(dest);
    }

    return result;
}

static bool decode(char *src_filename, char *dest_filename) {
    FILE *src = NULL, *dest = NULL;
    PLAC_header *plac = NULL;
    int16_t *output = NULL;
    int numread, numwritten;
    long int src_size, data_size, dest_size;
    bool result = false;

    output = malloc(PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == output) {
        fprintf(stderr, "Insufficient memory available\n");
        goto Cleanup;
    }

    if (verbose_flag) {
        printf("Decoding...\n");
        printf("Input: %s\n", src_filename);
        printf("Output: %s\n", dest_filename);
    }

    decoder_init();

    src = fopen(src_filename, "r");
    if (NULL == src) {
        fprintf(stderr, "Cannot open file \"%s\"\n", src_filename);
        goto Cleanup;
    }

    plac = plac_header_read(src);
    if (NULL == plac) {
        fprintf(stderr, "Input file must be PLAC format\n");
        goto Cleanup;
    }

    dest = fopen(dest_filename, "w");
    if (NULL == dest) {
        fprintf(stderr, "Cannot open file \"%s\"\n", dest_filename);
        goto Cleanup;
    }

    if (!pcm_flag) {
        fseek(dest, sizeof (WAVE_header), SEEK_SET);
    }

    /* Get source size */
    src_size = filesize(src);

    for (data_size = 0, dest_size = 0;;) {
        numread = decoder_decode(output, src);
        if (0 == numread) {
            break;
        }

        numwritten = fwrite(output, sizeof (int16_t), numread, dest);

        data_size += numread * sizeof (int16_t);
        dest_size += numwritten * sizeof (int16_t);
    }

    if (!pcm_flag) {
        dest_size += wav_header_write(dest, dest_size, PLAC_SAMPLE_RATE, WAV_STEREO, 16);
    }

    if (verbose_flag) {
        printf("Input Size:  %ld\n", src_size);
        printf("Data Size:   %ld\n", data_size);
        printf("Output Size: %ld\n", dest_size);
        printf("Delta:       %ld\n", dest_size - src_size);
    }

    result = true;

Cleanup:
    if (output) {
        free(output);
    }

    if (plac) {
        free(plac);
    }

    if (src) {
        fclose(src);
    }

    if (dest) {
        fclose(dest);
    }

    decoder_deinit();

    return result;
}

static int play(char *filename) {
    if (verbose_flag) {
        printf("Playing...\n");
        printf("File: %s\n", filename);
    }

    return player_play(filename);
}

static void usage(char *argv0) {
    printf("usage: %s"
            " [--encode <path>]"
            " [--decode <path>]"
            " [--pcm]"
            " [--play <path>]"
            " [-o <path>]"
            " [--verbose]\n", argv0);
}
