    processor 6502

    include "../vcs.h"
    include "../macro.h"

    seg code
    org $F000

start:

    CLEAN_START

nextframe:

    lda #2          ; "load accumulator" -> load value 2 to A register
    sta VBLANK      ; "store accumulator" -> store the value of A register in the memory ($01 address)
    sta VSYNC

    sta WSYNC
    sta WSYNC
    sta WSYNC

    lda #0
    sta VSYNC

    ldx #37
    
loopvblank:
    sta WSYNC
    dex
    bne  loopvblank

    lda #0
    sta VBLANK

    ; paint current screen
    ldx #192
loopscanline:
    stx COLUBK
    sta WSYNC
    dex
    bne loopscanline

    lda #2
    sta VBLANK
    ldx #30
overscan:
    sta WSYNC
    dex
    bne overscan

    jmp nextframe

    org $FFFC
    .word start
    .word start
