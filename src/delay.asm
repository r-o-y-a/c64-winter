delay
		jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1
        jsr start_wait1

        rts

start_wait1
        lda #$00
        sta wait_counter
wait1   
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait1
start_wait2
        lda #$00
        sta wait_counter
wait2   
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait2
start_wait3
        lda #$00
        sta wait_counter   
wait3
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait3
start_wait4
        lda #$00
        sta wait_counter   
wait4
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait4
start_wait5
        lda #$00
        sta wait_counter   
wait5
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait5
start_wait6
        lda #$00
        sta wait_counter   
wait6
        inc wait_counter
        lda wait_counter
        cmp #$ff
        bne wait6

        rts