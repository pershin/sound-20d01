/*
 * File:   main.c
 * Author: Sergey
 *
 * Created on October 29, 2023, 7:04 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <getopt.h>
#include <signal.h>
#include <unistd.h>
#include "plac.h"
#include "encoder.h"
#include "decoder.h"
#include "player.h"
#include "wav.h"

/* Flag set by ‘--verbose’. */
int verbose_flag = 0;
volatile int stop_flag = 0;

static int decode(char *, char *);
static int encode(char *, char *);
static long int filesize(FILE *);
static int play(char *);
static void usage(char *);

static void signal_handler(int sig) {
    stop_flag = 1;
    printf("\b\bStoping... (%d)\n", sig);
}

int main(int argc, char** argv) {
    int c, option_index;
    char *src_filename, *dest_filename;
    static int encode_flag, decode_flag, play_flag;

    static struct option long_options[] = {
        {"verbose", no_argument, &verbose_flag, 1},
        {"encode", required_argument, &encode_flag, 1},
        {"decode", required_argument, &decode_flag, 1},
        {"play", required_argument, &play_flag, 1},
        {0, 0, 0, 0}
    };

    signal(SIGINT, signal_handler);
    signal(SIGILL, signal_handler);
    signal(SIGABRT, signal_handler);
    signal(SIGFPE, signal_handler);
    signal(SIGSEGV, signal_handler);
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
        return encode(src_filename, dest_filename);
    }

    if (decode_flag) {
        return decode(src_filename, dest_filename);
    }

    if (play_flag) {
        return play(src_filename);
    }

    return EXIT_SUCCESS;
}

static int encode(char *src_filename, char *dest_filename) {
    FILE *src, *dest;
    WAVE_header *wav;
    int16_t *input;
    int numread, numwritten;
    long int src_size, dest_size;

    input = malloc(PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == input) {
        fprintf(stderr, "Insufficient memory available\n");
        return EXIT_FAILURE;
    }

    src = fopen(src_filename, "r");
    if (NULL == src) {
        fprintf(stderr, "Cannot open file \"%s\"\n", src_filename);
        return EXIT_FAILURE;
    }

    wav = wav_header_read(src);
    if (NULL == wav) {
        fprintf(stderr, "Input file must be WAV format\n");
        return EXIT_FAILURE;
    }

    dest = fopen(dest_filename, "w");
    if (NULL == dest) {
        fprintf(stderr, "Cannot open file \"%s\"\n", dest_filename);
        fclose(src);
        return EXIT_FAILURE;
    }

    if (verbose_flag) {
        printf("Encoding...\n");
        printf("Input: %s\n", src_filename);
        printf("Output: %s\n", dest_filename);
    }

    dest_size = plac_header_write(dest);

    for (src_size = ftell(src); src_size < wav->data.Size;) {
        numread = fread(input, sizeof (int16_t), PLAC_BUFSIZ * PLAC_NUM_CHANNELS, src);
        if (0 == numread) {
            break;
        }

        numwritten = encoder_encode(input, dest, numread);

        src_size += numread * sizeof (int16_t);
        dest_size += numwritten;
    }

    if (verbose_flag) {
        printf("Input Size:  %ld\n", src_size);
        printf("Output Size: %ld\n", dest_size);
        printf("Delta:       %ld\n", dest_size - src_size);
    }

    free(wav);
    free(input);

    fclose(src);
    fclose(dest);

    return EXIT_SUCCESS;
}

static int decode(char *src_filename, char *dest_filename) {
    FILE *src, *dest;
    PLAC_header *plac;
    int16_t *output;
    int numread, numwritten;
    long int src_size, data_size, dest_size;

    output = malloc(PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == output) {
        fprintf(stderr, "Insufficient memory available\n");
        return EXIT_FAILURE;
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
        return EXIT_FAILURE;
    }

    plac = plac_header_read(src);
    if (NULL == plac) {
        fprintf(stderr, "Input file must be PLAC format\n");
        return EXIT_FAILURE;
    }

    dest = fopen(dest_filename, "w");
    if (NULL == dest) {
        fprintf(stderr, "Cannot open file \"%s\"\n", dest_filename);
        fclose(src);
        return EXIT_FAILURE;
    }

    fseek(dest, sizeof (WAVE_header), SEEK_SET);

    /* Get source size */
    src_size = filesize(src);

    for (data_size = 0, dest_size = 0;;) {
        numread = decoder_decode(src, output);
        if (0 == numread) {
            break;
        }

        numwritten = fwrite(output, sizeof (int16_t), numread, dest);

        data_size += numread * sizeof (int16_t);
        dest_size += numwritten * sizeof (int16_t);
    }

    dest_size += wav_header_write(dest, dest_size, PLAC_SAMPLE_RATE, WAV_STEREO, 16);

    if (verbose_flag) {
        printf("Input Size:  %ld\n", src_size);
        printf("Data Size:   %ld\n", data_size);
        printf("Output Size: %ld\n", dest_size);
        printf("Delta:       %ld\n", dest_size - src_size);
    }

    free(output);
    free(plac);

    fclose(src);
    fclose(dest);

    decoder_deinit();

    return EXIT_SUCCESS;
}

/* Get file size in bytes. */
static long int filesize(FILE *stream) {
    long int offset, size;

    offset = ftell(stream);
    fseek(stream, 0, SEEK_END);
    size = ftell(stream);
    fseek(stream, offset, SEEK_SET);

    return size;
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
            " [--play <path>]"
            " [-o <path>]"
            " [--verbose]\n", argv0);
}

/*
static void test() {
    int i, j;
    int buf[] = {
        0, 1, 2, 3, 4, 5, 6, 7,
        8, 9, 10, 11, 12, 13, 14, 15,
        16, 17, 18, 19, 20, 21, 22, 23

    };
    int n = sizeof (buf) / sizeof (buf[0]);

    for (j = 1; n / 2 > j; j++) {
        for (i = j; n - 2 > i; i++) {
            int tmp = buf[i];

            buf[i] = buf[i + 1];
            buf[i + 1] = tmp;
        }
    }

    for (i = 0; n / 2 > i; i++) {
        printf("%d ", buf[i]);
    }

    printf("\n");

    for (; n > i; i++) {
        printf("%d ", buf[i]);
    }

    printf("\n");
}
 */
