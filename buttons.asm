
  ; controller reading, two times
read_controller:
  jsr .real ; first read
  ldx <BUTTONS_TMP
  jsr .real ; second read
  cpx <BUTTONS_TMP ; lets compare values
  bne .end ; ignore it if not equal
  stx <BUTTONS ; storing value
.end:
  jsr konami_code_check
  rts

  ; real controller read, stores buttons to BUTTONS_TMP
.real:
  lda #1
  sta $4016
  lda #0
  sta $4016
  ldy #8
.read_button:
  lda $4016
  and #$03
  cmp #$01
  ror <BUTTONS_TMP
  dey
  bne .read_button
  rts

konami_code_check:
  ldy <KONAMI_CODE_STATE
  lda <BUTTONS
  beq .end
  cmp <LAST_KONAMI_BUTTON
  beq .end
  cmp konami_code, y
  bne .check_fail
  iny
  cpy #konami_code_length
  bne .end
  ldy #1
  sty KONAMI_CODE_TRIGGERED
  jmp .end
.check_fail:
  ldy #0
  lda konami_code ; на случай, если нажатая кнопка - начало новой последовательности
  cmp <BUTTONS
  bne .end
  iny
.end:
  sty <KONAMI_CODE_STATE
  sta <LAST_KONAMI_BUTTON
  rts

konami_code:
  .db $10, $10, $20, $20, $40, $80, $40, $80, $02, $01
konami_code_length .equ 10
