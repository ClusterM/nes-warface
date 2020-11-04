  ; далее методы в нулевом банке
  .bank 0
  .org $8000

init:
  lda #%00000000 ; Выключаем пока что PPU
  sta PPUSTATUS
  sta PPUMASK
  jsr wait_blank_simple
  jsr load_black  ; Делаем экран чёрным

  ; Определяем тип консоли
  jsr wait_blank_simple
console_detect:
  inx
  bne console_detect_s
  iny
console_detect_s:  
  lda PPUSTATUS
  bpl console_detect
  lda #$00
  cpy #$09
  bne console_detect_not_ntsc
console_detect_not_ntsc:
  cpy #$0A
  bne console_detect_not_pal
  ora #$01
console_detect_not_pal:
  cpy #$0B
  bne console_detect_not_dendy
  ora #$01
console_detect_not_dendy:
  sta <CONSOLE_TYPE

  ; Обнуляем звуковые регистры
  lda #0
  sta $4000
  sta $4001
  sta $4002
  sta $4003
  sta $4004
  sta $4005
  sta $4006
  sta $4007
  sta $4009
  sta $400A
  sta $400C
  sta $400D
  sta $400E
  sta $400F
  sta $4010
  sta $4011
  sta $4012
  sta $4013
  lda #$0F
  sta $4015
  lda #$40
  sta $4017
  lda #0

  rts

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

  ; загружаем 16 байт палитры во временную память
preload_palette:
  ldy #$00
  ldx #16
.loop:
  lda [PAL_SOURCE_ADDR], y
  sta PALETTE_CACHE, y
  iny
  dex
  bne .loop
  rts

  ; загружаем 16 байт палитры в $3F00
load_palette:
  lda #LOW(PALETTE_CACHE)
  sta COPY_SOURCE_ADDR
  lda #HIGH(PALETTE_CACHE)
  sta COPY_SOURCE_ADDR+1
  lda #$3F
  sta $2006
  lda #$00
  sta $2006
  ldy #$00
  ldx #16
.loop:
  lda [COPY_SOURCE_ADDR], y
  sta $2007
  iny
  dex
  bne .loop
  bit PPUSTATUS
  rts

  ; затемняет загруженную палитру
dim:
  ldx #0
.loop:
  lda PALETTE_CACHE, x
  sec
  sbc #$10
  bpl .not_minus
  lda #$1D  
.not_minus:
  cmp #$0D
  bne .not_very_black
  lda #$1D
.not_very_black:
  sta PALETTE_CACHE, x
  inx
  cpx #16
  bne .loop
  rts

dim_in_s:
  jsr preload_palette
  jsr dim
  jsr dim
  jsr load_palette
  jsr wait_blank5
  jsr preload_palette
  jsr dim
  jsr load_palette
  jsr wait_blank5
  jsr preload_palette
  jsr load_palette
  jsr wait_blank
  rts

dim_out_s:
  jsr preload_palette
  jsr dim
  jsr load_palette
  jsr wait_blank5
  jsr preload_palette
  jsr dim
  jsr dim
  jsr load_palette
  jsr wait_blank5
  jsr preload_palette
  jsr dim
  jsr dim
  jsr dim
  jsr load_palette
  jsr wait_blank5
  jsr load_black
  jsr wait_blank
  rts

title_palette:
  .incbin "title_palette_0.bin"
  .incbin "title_palette_1.bin"
  .incbin "title_palette_2.bin"
  .incbin "title_palette_3.bin"

