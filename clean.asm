init:
  lda #%10000000 ; выключаем пока что PPU, но оставляем NMI
  sta PPUCTRL
  lda #%00000000
  sta PPUMASK
  jsr wait_blank_simple
  jsr load_black  ; делаем экран чёрным

  ; очистка памяти
  lda #$00
  sta <COPY_SOURCE_ADDR
  sta <COPY_SOURCE_ADDR+1
  lda #0
  ldy #$22
.memory_clean_loop:
  sta [COPY_SOURCE_ADDR], y
  iny  
  bne .memory_clean_loop

  ; загрузка спрайтов
  lda #LOW(sprites_data)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(sprites_data)
  sta <COPY_SOURCE_ADDR+1
  lda #LOW(SPRITES)
  sta <COPY_DEST_ADDR
  lda #HIGH(SPRITES)
  sta <COPY_DEST_ADDR+1
  ldy #0
.sprites_clean_loop:
  lda [COPY_SOURCE_ADDR], y
  sta [COPY_DEST_ADDR], y
  iny  
  bne .sprites_clean_loop
  lda #0
  sta OAMADDR
  lda #HIGH(SPRITES)  
  sta OAMDMA

  ; определяем тип консоли
  lda #%00000000 ; отключаем NMI
  sta PPUCTRL
  bit PPUSTATUS
console_detect_init:
  bit PPUSTATUS
  bpl console_detect_init
console_detect_loop:
  inx
  bne console_detect_s
  iny
console_detect_s:  
  bit PPUSTATUS
  bpl console_detect_loop
  lda #$01
  cpy #$09
  bne console_detect_end
  lda #$00
console_detect_end:
  sta <CONSOLE_TYPE
  ; включаем NMI
  lda #%10000000
  sta PPUCTRL

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
