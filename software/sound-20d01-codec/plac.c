#include <stdio.h>
#include <stdlib.h>
#include "plac.h"

int plac_header_write(FILE *stream) {
    PLAC_header *plac;
    int numwritten;

    plac = malloc(sizeof (PLAC_header));
    if (NULL == plac) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    plac->FormatID = PLAC_ID;

    fseek(stream, 0, SEEK_SET);

    numwritten = fwrite(plac, sizeof (PLAC_header), 1, stream);

    free(plac);

    return numwritten * sizeof (PLAC_header);
}

PLAC_header *plac_header_read(FILE *stream) {
    PLAC_header *plac;
    int numread;

    plac = malloc(sizeof (PLAC_header));
    if (NULL == plac) {
        fprintf(stderr, "Insufficient memory available\n");
        return NULL;
    }

    fseek(stream, 0, SEEK_SET);

    numread = fread(plac, sizeof (PLAC_header), 1, stream);
    if (1 != numread) {
        free(plac);
        return NULL;
    }

    if (PLAC_ID != plac->FormatID) {
        free(plac);
        return NULL;
    }

    return plac;
}
