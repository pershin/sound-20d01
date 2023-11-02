#include <stdio.h>
#include <stdlib.h>
#include <alloca.h>
#include <alsa/asoundlib.h>
#include "wav.h"
#include "plac.h"
#include "decoder.h"

#define PCM_DEVICE "default"

extern int verbose_flag;
extern int stop_flag;

snd_pcm_t *pcm;
snd_pcm_uframes_t frames;

void pcm_device_init(unsigned int rate, int channels) {
    snd_pcm_hw_params_t *params;

    /* Open the PCM device in playback mode */
    snd_pcm_open(&pcm, PCM_DEVICE, SND_PCM_STREAM_PLAYBACK, 0);

    /* Allocate parameters object and fill it with default values */
    snd_pcm_hw_params_alloca(&params);

    snd_pcm_hw_params_any(pcm, params);

    /* Set parameters */
    snd_pcm_hw_params_set_access(pcm, params, SND_PCM_ACCESS_RW_INTERLEAVED);
    snd_pcm_hw_params_set_format(pcm, params, SND_PCM_FORMAT_S16_LE);
    snd_pcm_hw_params_set_channels(pcm, params, channels);
    snd_pcm_hw_params_set_rate_near(pcm, params, &rate, 0);

    /* Write parameters */
    snd_pcm_hw_params(pcm, params);

    /* Allocate buffer to hold single period */
    snd_pcm_hw_params_get_period_size(params, &frames, 0);
}

void pcm_device_deinit(void) {
    snd_pcm_drop(pcm);
    snd_pcm_drain(pcm);
    snd_pcm_close(pcm);
}

int player_play(char *filename) {
    FILE *stream;
    WAVE_header *wav;
    PLAC_header *plac;
    int buffer_size, sample_rate, channels, bits_per_sample, numread;
    int16_t *buffer;

    stream = fopen(filename, "r");
    if (NULL == stream) {
        fprintf(stderr, "Cannot open file \"%s\"\n", filename);
        return EXIT_FAILURE;
    }

    wav = wav_header_read(stream);
    if (NULL == wav) {
        plac = plac_header_read(stream);
        if (!plac) {
            fprintf(stderr, "Format is not supported\n");
            return EXIT_FAILURE;
        }
    }

    if (NULL != wav) {
        sample_rate = wav->fmt.SampleRate;
        bits_per_sample = wav->fmt.BitsPerSample;
        channels = wav->fmt.NumChannels;
    } else {
        decoder_init();
        sample_rate = PLAC_SAMPLE_RATE;
        bits_per_sample = PLAC_BITS_PER_SAMPLE;
        channels = PLAC_NUM_CHANNELS;
    }

    if (verbose_flag) {
        printf("Sample Rate: %d\n", sample_rate);
        printf("Bits Per Sample: %d\n", bits_per_sample);
        printf("Num Channels: %d\n", channels);
    }

    pcm_device_init(sample_rate, channels);

    buffer_size = frames * channels * 2;

    if (NULL == wav) {
        buffer_size = PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t);
    }

    buffer = malloc(buffer_size);
    if (NULL == buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return EXIT_FAILURE;
    }

    for (stop_flag = 0; !stop_flag;) {
        if (NULL != wav) {
            numread = fread(buffer, sizeof (int8_t), buffer_size, stream);
        } else {
            numread = decoder_decode(stream, buffer);
            frames = numread / 2;
        }

        if (0 == numread) {
            break;
        }

        snd_pcm_writei(pcm, buffer, frames);
    }

    pcm_device_deinit();

    if (NULL != wav) {
        free(wav);
    } else {
        decoder_deinit();
        free(plac);
    }

    free(buffer);

    fclose(stream);

    return EXIT_SUCCESS;
}
