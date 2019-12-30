init_screen     ldx #$00        ; set X to zero (black color code)
                stx $d021        ; set background color
                stx $d020        ; set border color

                lda #$20         ; #$20 is the spacebar Screen Code
clear           sta $0400,x      ; fill four areas with 256 spacebar characters
                sta $0500,x
                sta $0600,x
                sta $0700,x
                dex
                bne clear

                rts
