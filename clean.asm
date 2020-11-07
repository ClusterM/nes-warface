  ; очищаем nametable
clear_screen:
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda #$00
  ldx #0
  ldy #$10
.loop:
  sta PPUDATA
  inx
  bne .loop
  dey
  bne .loop
  rts

load_black:
  ; загружаем пустую палитру по адресу $3F00 в PPU
  lda #$3F
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #$00
  lda #$1D ; чёрный цвет
.loop:
  sta PPUDATA
  inx
  cpx #32
  bne .loop
  rts
