show_image1
    lda #0
    sta $d020
    lda #0
    sta $d021
    lda #$15
    sta $d018

    ldx #$00
loop_image1
    lda screen_001+2+0*$100,x
    sta $0400+0*$100,x
    lda screen_001+2+25*40+0*$100,x
    sta $d800+0*$100,x

    lda screen_001+2+1*$100,x
    sta $0400+1*$100,x
    lda screen_001+2+25*40+1*$100,x
    sta $d800+1*$100,x

    lda screen_001+2+2*$100,x
    sta $0400+2*$100,x
    lda screen_001+2+25*40+2*$100,x
    sta $d800+2*$100,x

    lda screen_001+2+$2e8,x
    sta $0400+$2e8,x
    lda screen_001+2+25*40+$2e8,x
    sta $d800+$2e8,x
    inx
    bne loop_image1

infloop_image1
wait_first_line_image1
    ldx $d012
    lda $d011
    and #$80
    bne wait_first_line_image1
    cpx #0
    bne wait_first_line_image1
    jmp infloop_image1


; PETSCII memory layout (example for a 40x25 screen)
; byte  0         = border color
; byte  1         = background color
; bytes 2-1001    = screencodes
; bytes 1002-2001 = color
screen_001
!byte 0,0
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,23,9,14,20,5,18,32,9,14,32,19,23,5,4,5,14,46,46,46,32,32,32,32,32,32,32,32
!byte 32,32,102,102,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,102,102,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32
!byte 32,102,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,46,32,46,32,32
!byte 32,102,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,102,102,160,160,160,160,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,102,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,46,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,102,32,32,32,32,32,32,32,32,32,32,102,160,32,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,32,102,160,32,32,32,32,32,32,32,102,160,160,32,32,32,32,32,32,32,32,32,102,160,160,32,32,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,102,160,160,160,32,32,32,32,32,102,160,160,160,160,32,32,32,32,32,32,32,102,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32
!byte 32,32,32,102,160,160,160,160,32,32,32,32,102,160,160,160,160,160,160,32,32,32,32,102,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32
!byte 32,32,102,160,160,160,160,160,160,160,32,32,102,160,160,160,160,160,32,32,32,32,32,102,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32
!byte 32,32,102,160,160,160,160,160,160,32,32,102,160,160,160,160,160,160,160,32,32,32,32,102,160,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32
!byte 32,102,160,160,160,160,160,160,160,32,32,32,102,160,160,160,160,32,32,32,32,32,102,160,160,160,160,160,160,160,160,32,32,160,160,160,160,160,32,32
!byte 32,102,160,160,160,160,160,160,160,160,160,32,32,32,160,32,32,32,32,32,32,32,32,32,32,32,160,32,32,32,160,160,160,160,160,160,160,160,160,32
!byte 32,32,32,32,32,160,32,32,32,32,32,32,32,32,160,32,160,160,160,160,160,32,32,32,32,32,160,32,32,160,160,160,160,160,160,160,160,160,160,160
!byte 32,32,32,102,102,160,160,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,32,32,32,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 32,102,102,102,160,160,160,160,160,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160,32,32,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,14,1,1,14,1,1,1,1,1,1,1,1,1,14,14,14,14,14,14,14,14
!byte 14,14,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,11,11,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,14,14,14,14
!byte 14,11,11,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,1,14,14,14,14,14,14,14,14,0,14,1,14,14
!byte 14,11,11,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,11,11,11,11,11,11,14,14,14,14,14,14,14,14,1,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,14,14,14,14,14,1,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,1,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,1,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,5,14,14,14,14,14,14,14,14,14,14,5,5,14,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,14,5,5,14,14,14,14,14,14,14,5,5,5,14,14,14,14,14,14,14,14,14,5,5,5,14,14,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,5,5,5,5,14,14,14,14,14,5,5,5,5,5,14,14,14,14,14,14,14,5,5,5,5,5,5,14,14,14,14,14,14,14,14,14,14
!byte 14,14,14,5,5,5,5,5,14,14,14,14,5,5,5,5,5,5,5,14,14,14,14,5,5,5,5,5,5,5,14,14,14,14,14,14,14,14,14,14
!byte 14,14,5,5,5,5,5,5,5,5,14,14,5,5,5,5,5,5,14,14,14,14,14,5,5,5,5,5,5,5,14,14,14,14,14,14,14,14,14,14
!byte 14,14,5,5,5,5,5,5,5,14,14,5,5,5,5,5,5,5,5,14,14,14,14,5,5,5,5,5,5,5,5,14,14,14,14,14,14,14,14,14
!byte 14,5,5,5,5,5,5,5,5,14,14,14,5,5,5,5,5,14,14,14,14,14,5,5,5,5,5,5,5,5,5,14,14,9,9,9,9,9,14,14
!byte 14,5,5,5,5,5,5,5,5,5,5,14,14,14,5,14,14,14,14,14,14,14,14,14,14,14,5,14,14,14,9,9,9,9,9,9,9,9,9,14
!byte 14,14,14,14,14,5,14,14,14,14,14,14,14,14,5,14,9,9,9,9,9,14,14,14,14,14,5,14,14,9,9,9,9,9,9,9,9,9,9,9
!byte 14,14,14,9,9,5,9,14,14,14,14,14,14,14,9,9,9,9,9,9,9,9,9,14,14,14,5,9,9,9,9,9,9,9,9,9,9,9,9,9
!byte 14,9,9,9,9,9,9,9,9,14,14,14,14,9,9,9,9,9,9,9,9,9,9,9,14,14,9,9,9,9,9,9,9,9,9,9,9,9,9,9
!byte 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9

rts