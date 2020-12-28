    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000

START:

    CLEAN_START

    ; set background to yellow
    lda #$1E        ; load value to A registry
    sta COLUBK      ; store A registry value to memory address $09

    jmp START

    org $FFFC
    .word START
    .word START
