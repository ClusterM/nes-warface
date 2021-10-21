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

  ; загружаем 4 байта палитры во временную память
preload_palette_4:
  ldy #$00
  ldx #4
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
  sta <COPY_SOURCE_ADDR
  lda #HIGH(PALETTE_CACHE)
  sta <COPY_SOURCE_ADDR+1
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
  rts

  ; загружаем 16 байт палитры в $3F10
load_sprite_palette:
  lda #LOW(PALETTE_CACHE)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(PALETTE_CACHE)
  sta <COPY_SOURCE_ADDR+1
  lda #$3F
  sta $2006
  lda #$10
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

  ; затемняет загруженную палитру, только 4 байта
dim_4:
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
  cpx #4
  bne .loop
  rts

  ; плавно проявляет экран
dim_in:
  jsr preload_palette
  jsr dim
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr preload_palette
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr preload_palette
  jsr load_palette
  jsr wait_blank
  rts

  ; плавно затухает экран
dim_out:
  jsr preload_palette
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr load_black
  jsr wait_blank
  rts
