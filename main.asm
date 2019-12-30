	!cpu 6502
	!to "build/winter.prg",cbm  

	!source "src/constants.asm"



	* = $0801                             ; BASIC start address (#2049)
	!byte $0d,$08,$dc,$07,$9e,$20,$34,$39 ; BASIC loader to start at $c000...
	!byte $31,$35,$32,$00,$00,$00         ; puts BASIC line 2012 SYS 49152
	* = $c000                             ; start address for 6502 code



	sei


	lda #$00 
    sta raster_counter
    sta duration_counter

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


; custom interrupt routine -- whenever raster beam reaches line zero, this is executed
irq     dec $d019        ; acknowledge IRQ and notify again on the next screen refresh


;jsr show_image1


loop1   lda #$fb ; (251)

loop2   cmp $d012 ; wait until it reaches 251th raster line ($fb)
        bne loop2 ; which is out of the inner screen area

loop4   inc raster_counter 
        lda raster_counter
        cmp #$ff    ; check if counter reached 255 (5 seconds)
        bne out

        lda duration_counter
        cmp #$ff
        bne loop5 
    

        lda #$00    ; reset both counters
        sta raster_counter
        sta duration_counter


        ; display the following after 10 seconds:


        ; **** DEBUG ******
        lda #$10    ; set border color
        sta $d020

        ;jsr show_image1


out
        lda $d012
loop3   cmp $d012
        beq loop3 

        jmp loop1  
        rts

loop5
        lda #$ff
        sta duration_counter

        ; **** DEBUG ******
        lda #$07    ; set border color
        sta $d020

        lda #$00    ; reset raster_counter
        sta raster_counter
        
        jmp out

        rts

showimage
        jsr show_image3
        rts


    ;jsr show_image1
    ;jsr show_image2
    ;jsr show_image3

	!source "src/image1.asm"
	!source "src/image2.asm"
    !source "src/image3.asm"
        !source "src/init_clearscreen.asm"


	jmp $ea31      ; return to Kernel routine
	







