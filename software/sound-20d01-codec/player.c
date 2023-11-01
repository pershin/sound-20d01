#include <stdio.h>
#include <stdlib.h>
#include <alloca.h>
#include <alsa/asoundlib.h>
#include "wav.h"

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
    int buffer_size, sample_rate, channels, numread;
    char *buffer;

    stream = fopen(filename, "r");
    if (NULL == stream) {
        fprintf(stderr, "Cannot open file \"%s\"\n", filename);
        return EXIT_FAILURE;
    }

    wav = wav_header_read(stream);
    if (NULL == wav) {
        fprintf(stderr, "Format is not supported\n");
        return EXIT_FAILURE;
    }

    if (verbose_flag) {
        printf("Sample Rate: %d\n", (int) wav->fmt.SampleRate);
        printf("Bits Per Sample: %d\n", (int) wav->fmt.BitsPerSample);
        printf("Num Channels: %d\n", (int) wav->fmt.NumChannels);
    }

    sample_rate = wav->fmt.SampleRate;
    channels = wav->fmt.NumChannels;

    free(wav);

    pcm_device_init(sample_rate, channels);

    buffer_size = frames * channels * 2;

    buffer = malloc(buffer_size);
    if (NULL == buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return EXIT_FAILURE;
    }

    stop_flag = 0;

    for (; !stop_flag;) {
        numread = fread(buffer, sizeof (char), buffer_size, stream);
        if (0 == numread) {
            break;
        }

        snd_pcm_writei(pcm, buffer, frames);
    }

    pcm_device_deinit();

    free(buffer);
    fclose(stream);

    return EXIT_SUCCESS;
}
