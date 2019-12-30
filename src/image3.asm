show_image3
    lda #0
    sta $d020
    lda #0
    sta $d021
    lda #$15
    sta $d018

    ldx #$00
loop_image3
    lda screen_003+2+0*$100,x
    sta $0400+0*$100,x
    lda screen_003+2+25*40+0*$100,x
    sta $d800+0*$100,x

    lda screen_003+2+1*$100,x
    sta $0400+1*$100,x
    lda screen_003+2+25*40+1*$100,x
    sta $d800+1*$100,x

    lda screen_003+2+2*$100,x
    sta $0400+2*$100,x
    lda screen_003+2+25*40+2*$100,x
    sta $d800+2*$100,x

    lda screen_003+2+$2e8,x
    sta $0400+$2e8,x
    lda screen_003+2+25*40+$2e8,x
    sta $d800+$2e8,x
    inx
    bne loop_image3

infloop_image3
wait_first_line_image3
    ldx $d012
    lda $d011
    and #$80
    bne wait_first_line_image3
    cpx #0
    bne wait_first_line_image3
    jmp infloop_image3


; PETSCII memory layout (example for a 40x25 screen)
; byte  0         = border color
; byte  1         = background color
; bytes 2-1001    = screencodes
; bytes 1002-2001 = color
screen_003
!byte 0,0
!byte 102,102,102,102,102,102,102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,102,102,102,102,160,160,160,160,160,160,160,147,143,160,135,140,143,143,141,153,174,174,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,32,32,32,32,32,32,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,160,160,160,160,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,32,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160
!byte 102,102,160,160,160,160,160,160,160,160,160,160,160,160,102,102,32,32,32,32,32,32,32,32,32,32,32,32,32,102,160,160,160,160,160,160,160,160,160,160
!byte 102,160,160,160,160,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,32,32,32,32,32,32,32,32,32,102,102,160,160,160,160,160,160,160,160,160
!byte 102,160,160,160,160,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,102,160,160,160,160,160,160,160,160,160
!byte 160,160,160,160,160,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,102,102,160,160,160,160,160,160,160,160
!byte 160,160,160,160,160,160,160,160,160,160,160,160,160,102,102,32,32,32,32,32,46,46,32,46,46,46,46,32,32,32,32,102,160,160,160,160,160,160,160,160
!byte 160,32,160,32,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,46,46,46,46,174,174,46,46,46,32,32,32,102,160,160,160,160,160,160,32,160
!byte 160,32,160,32,160,160,160,160,160,160,160,160,160,102,32,32,32,32,32,46,46,46,174,174,174,174,46,46,32,32,32,102,160,160,160,32,160,160,32,160
!byte 160,32,160,32,160,160,160,160,160,160,160,160,160,102,32,32,32,32,46,46,46,160,209,160,209,160,160,46,46,32,32,102,102,160,160,32,160,160,32,160
!byte 160,32,160,32,160,160,160,160,160,160,160,160,160,102,32,32,32,32,46,46,46,160,160,160,160,160,160,160,46,32,32,32,102,160,160,32,32,160,32,160
!byte 32,32,160,32,32,160,160,32,160,160,160,160,102,102,32,32,32,32,46,46,46,160,213,196,160,160,160,160,46,32,32,32,102,160,160,32,32,160,32,32
!byte 32,32,160,32,32,160,160,32,160,160,160,160,102,32,32,32,32,32,46,46,46,160,160,160,160,160,160,46,46,46,32,32,102,160,160,32,32,32,32,32
!byte 32,32,32,32,32,160,160,32,160,160,160,160,102,32,32,32,32,32,46,46,46,32,160,160,160,32,32,46,46,46,46,32,32,102,160,32,32,32,32,32
!byte 32,32,32,32,32,160,32,32,160,160,160,102,102,32,32,32,32,32,46,46,46,32,160,160,160,160,32,32,46,46,46,32,32,32,160,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,160,160,160,102,32,32,32,32,32,32,46,46,46,160,160,160,211,160,160,32,46,46,46,46,32,32,160,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,160,160,160,102,32,32,32,32,32,32,46,46,46,160,160,160,160,160,160,32,32,46,32,32,32,32,160,32,32,32,32,32
!byte 32,32,32,32,32,32,32,32,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,32,32,32,32,32
!byte 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,6,6,6,6,11,11,11,11,11,11
!byte 11,11,11,11,11,11,11,11,11,6,6,6,6,6,6,14,14,14,14,14,0,0,14,9,9,9,9,14,14,14,14,6,6,6,11,11,11,11,11,11
!byte 11,14,11,14,11,11,11,11,11,6,6,6,6,6,14,14,14,14,14,0,0,9,9,10,10,9,9,9,14,14,14,6,6,6,11,11,11,11,14,11
!byte 11,14,11,14,11,11,11,11,11,6,6,6,6,6,14,14,14,14,14,0,9,9,10,10,10,10,9,9,14,14,14,6,6,6,11,14,11,11,14,11
!byte 11,14,11,14,11,11,11,11,11,6,6,6,6,6,14,14,14,14,0,9,9,10,10,10,10,10,10,9,9,14,14,6,6,6,11,14,11,11,14,11
!byte 11,14,11,14,11,11,11,11,11,6,6,6,6,6,14,14,14,14,0,9,9,10,10,10,10,10,10,10,9,14,14,14,6,6,11,14,14,11,14,11
!byte 14,14,11,14,14,11,11,14,11,6,6,6,6,6,14,14,14,14,0,9,9,10,10,10,10,10,10,10,9,14,14,14,6,6,11,14,14,11,14,14
!byte 14,14,11,14,14,11,11,14,11,6,6,6,6,14,14,14,14,14,0,9,9,10,10,10,10,10,10,9,9,9,14,14,6,6,11,14,14,14,14,14
!byte 14,14,14,14,14,11,11,14,11,6,6,6,6,14,14,14,14,14,0,9,9,14,9,9,9,14,14,9,9,9,9,14,14,6,11,14,14,14,14,14
!byte 14,14,14,14,14,11,14,14,11,6,6,6,6,14,14,14,14,14,0,9,9,14,9,9,9,9,14,14,9,9,9,14,14,14,11,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,11,6,6,6,14,14,14,14,14,14,0,9,9,9,9,9,9,9,9,14,9,9,9,9,14,14,11,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,11,6,6,6,14,14,14,14,14,14,0,9,9,9,9,9,9,9,9,14,14,9,14,14,14,14,11,14,14,14,14,14
!byte 14,14,14,14,14,14,14,14,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,14,14,14,14,14

rts