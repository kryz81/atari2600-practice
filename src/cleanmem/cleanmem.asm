    processor 6502

    seg code
    org $F000       ; define the code origin at $F000

start:

    sei             ; disable interrupts
    cld             ; clear the BCD decimal math mode
    ldx #$FF        ; load the x register with #$FF
    txs             ; transfer the x register to the stack pointer

    lda #0          ; A = 0
    ldx #$FF        ; X = #$FF
    sta $FF         ; make sure $FF is zeroed before the loop starts

clearmem:

    dex             ; X--
    sta $0,X        ; store the value of A inside memory address $0 + X
    bne clearmem    ; loop until x is equal to 0 (z-flag is set)

    org $FFFC
    .word start
    .word start
