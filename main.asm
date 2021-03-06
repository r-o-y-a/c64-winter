    	!cpu 6502
    	!to "build/winter.prg",cbm  

    	!source "src/constants.asm"
        !source "src/load_res.asm"
        !source "src/delay.asm"
        !source "src/init_clearscreen.asm"
        !source "src/image1.asm"
        !source "src/image2.asm"
        !source "src/image3.asm"

    	* = $0801                             ; BASIC start address (#2049)
    	!byte $0d,$08,$dc,$07,$9e,$20,$34,$39 ; BASIC loader to start at $c000...
    	!byte $31,$35,$32,$00,$00,$00         ; puts BASIC line 2012 SYS 49152
    	* = $c000                             ; start address for 6502 code

        jsr sid_init
        jsr sid_play

    	sei
        

    	lda #$00 
        sta raster_counter
        
        lda #$00
        sta last_slide_number

        jsr show_image1
        jsr show_slides


        ; turn off other sources of interupts
        ldy #$7f    ; $7f = %01111111
        sty $dc0d   ; Turn off CIAs Timer interrupts
        sty $dd0d   ; Turn off CIAs Timer interrupts
        lda $dc0d   ; cancel all CIA-IRQs in queue/unprocessed
        lda $dd0d   ; cancel all CIA-IRQs in queue/unprocessed

        lda #$01    ; In the address $D01A we set Bit 0 to let the VIC-II know that  
        sta $d01a   ; we want to request a notification from a raster beam event.

        lda $d011   ; Bit#7 of $d011 is basically...
        and #$7f    ; ...the 9th Bit for $d012
        sta $d011   ; we need to make sure it is set to zero

        lda #<irq   ; point IRQ Vector to our custom irq routine
        ldx #>irq
        sta $314    ; store in $314/$315
        stx $315

        lda #$00    ; init value: 00 - we define at what line number the interrupt should be triggered 
        sta $d012   ; (could use any line num here, just want a notification once per screen refresh)



        cli         ; clear interrupt disable flag
        jmp *       ; infinite loop


                        ; custom interrupt routine -- whenever raster beam 
                        ; reaches line zero, this is executed
irq     dec $d019       ; acknowledge IRQ and notify again on the next 
                        ; screen refresh


main_loop   
        lda #$fb

loop2   
        cmp $d012 ; wait until it reaches 251th raster line ($fb)
        bne loop2 ; which is out of the inner screen area

loop4   
        inc raster_counter 
        lda raster_counter
        cmp #$01    ; check if counter reached (decreased to 01 because
        bne out     ; not using interrupt for now -- using delays instead)

        lda #$00    
        sta raster_counter


        jsr show_slides     

out
        lda $d012
loop3   cmp $d012
        beq loop3 

        jmp main_loop  
        rts


show_slides
        lda last_slide_number
        cmp #$00
        beq do_slide1
        cmp #$01
        beq do_slide2
        cmp #$02
        beq do_slide3
        rts

do_slide1
        inc last_slide_number
        jsr image1_twinkle_stars

do_slide2
        inc last_slide_number
        jsr show_image2
        jsr out
        rts

do_slide3
        inc last_slide_number
        jsr show_image3
        jsr out
        rts


color_border ;for debugging purposes
        lda #$06
        sta $d020
        rts
flash_border ;for debugging purposes
        inc $d020
        jsr flash_border
        rts


        jmp $ea31      ; return to Kernel routine
	







