  ; далее методы в нулевом банке
  .bank 0
  .org $8000

init:
  lda #%10000000 ; выключаем пока что PPU, но оставляем NMI
  sta PPUCTRL
  lda #%00000000
  sta PPUMASK
  jsr wait_blank_simple
  jsr load_black  ; делаем экран чёрным

  ; очистка памяти
  lda #$00
  sta COPY_SOURCE_ADDR
  sta COPY_SOURCE_ADDR+1
  lda #0
  ldy #$22
.memory_clean_loop:
  sta [COPY_SOURCE_ADDR], y
  iny  
  bne .memory_clean_loop

  lda #0
  sta OAMADDR
  lda #$FF
  ldx #0
.clean_oam_next:
  sta OAMDATA
  inx
  bne .clean_oam_next

  ; определяем тип консоли
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

  ; загружаем 16 байт палитры в $3F10
load_sprite_palette:
  lda #LOW(PALETTE_CACHE)
  sta COPY_SOURCE_ADDR
  lda #HIGH(PALETTE_CACHE)
  sta COPY_SOURCE_ADDR+1
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

dim_in_s:
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

dim_out_s:
  jsr preload_palette
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr preload_palette
  jsr dim
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr preload_palette
  jsr dim
  jsr dim
  jsr dim
  jsr load_palette
  ldx #5
  jsr wait_blank_x
  jsr load_black
  jsr wait_blank
  rts

print_text:
  ; выключаем PPU
  jsr disable_ppu
  ; выбираем последний CHR банк
  lda #%00011111
  sta $6001
  ; очищаем экран
  jsr clear_screen
  ; загружаем палитру
  lda #LOW(symbols_palette)
  sta PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta PAL_SOURCE_ADDR+1
  jsr preload_palette
  jsr load_palette
  lda #3
  sta TEXT_LINE
  lda #1
  sta TEXT_POS
  sta SPRITES_ENABLED
  lda #0
  sta TEXT_NAMETABLE
  sta TEXT_SCROLL_STARTED
  jsr reset_scroll
  jsr wait_blank_simple
  jsr enable_ppu
.next_char:
  ldy #0
  lda [TEXT_SOURCE_ADDR], y
  beq .end
  cmp #$FF
  bne .not_next_line
  ; переходим на следующую строку
  jsr next_line
  jmp .inc_source_pos
.not_next_line:
  ; печатаем символ
  jsr symbol_print
  lda KONAMI_CODE_TRIGGERED
  bne .exit_to_credits
.inc_source_pos:
  inc TEXT_SOURCE_ADDR
  bne .inc_text_pos
  inc TEXT_SOURCE_ADDR+1
.inc_text_pos:
  inc TEXT_POS
  jmp .next_char
.end:
  lda THE_END
  beq .not_the_end
.endless_loop:
  jsr wait_blank
  lda KONAMI_CODE_TRIGGERED
  bne .exit_to_credits
  jmp .endless_loop
.not_the_end
  jsr wait_buttons_not_pressed
  jsr wait_any_button
  lda #LOW(symbols_palette)
  sta PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta PAL_SOURCE_ADDR+1
  jsr dim_out
  lda #0
  sta SPRITES_ENABLED
  rts
.exit_to_credits:
  lda #LOW(symbols_palette)
  sta PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta PAL_SOURCE_ADDR+1
  jsr dim_out
  lda #0
  sta SPRITES_ENABLED
  jmp credits

  ; определяем адрес, куда писать символ
symbol_address:
  pha
  bit PPUSTATUS
  lda TEXT_NAMETABLE
  bne .second_nametable
  lda TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$20  
  jmp .write_nametable_hi
.second_nametable:
  lda TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$28
.write_nametable_hi
  sta PPUADDR
  lda TEXT_LINE
  asl A
  asl A
  asl A
  asl A
  asl A
  ora TEXT_POS
  sta PPUADDR
  pla
  rts

  ; печать символа из регистра A
symbol_print:
  pha
  ; при удержании любой кнопки ускоряем
  lda BUTTONS
  bne .skip_sprite_draw
  
  ; настраиваем спрайт
  jsr wait_blank
  lda #$FF
  sta OAMDATA
  pla
  sta OAMDATA
  pha
  lda #0
  sta OAMDATA
  lda TEXT_POS
  asl A
  asl A
  asl A
  sta OAMDATA

  jsr wait_blank

  ; плавно увеличиваем яркость
  jsr preload_palette
  jsr dim
  jsr dim
  jsr wait_blank
  jsr .set_sprite_y
  jsr load_sprite_palette

  jsr preload_palette
  jsr dim
  jsr wait_blank
  jsr .set_sprite_y
  jsr load_sprite_palette

.skip_sprite_draw:
  ; скрываем спрайт
  jsr wait_blank
  lda #0
  sta OAMADDR
  lda #$FF
  sta OAMDATA
  ; вычисляем адреса
  ;jsr wait_blank
  jsr symbol_address
  pla
  ; печатаем символ
  sta PPUDATA
  jsr wait_blank
  rts

.set_sprite_y:
  lda #0
  sta OAMADDR
  lda TEXT_LINE
  asl A
  asl A
  asl A
  sec
  sbc SCROLL_POS
  bcs .not_ovf
  sec
  sbc #16
.not_ovf
  sec
  sbc #1
  ldx SCROLL_POS
  cpx SCROLL_TARGET_POS
  beq .not_scrolling
  sec
  sbc #1
.not_scrolling:
  sta OAMDATA
  rts

  ; переход на следующую строку
next_line:
  jsr wait_blank
  lda #0
  sta TEXT_POS
  ; увеличиваем номер строки
  inc TEXT_LINE
  lda TEXT_LINE
  ; если он равен 30...
  cmp #30
  bne .scroll_check
  ; обнуляем строку
  lda #0
  sta TEXT_LINE
  ; меняем nametable
  lda TEXT_NAMETABLE
  eor #1
  sta TEXT_NAMETABLE
  ; проверка, не пора ли начинать скроллинг
.scroll_check:
  lda TEXT_LINE
  cmp #27 ; на какой строке начинать скроллить
  bne .not_scroll_start
  ; пора
  inc TEXT_SCROLL_STARTED
.not_scroll_start:
  ; включен ли сейчас скроллиг?
  lda TEXT_SCROLL_STARTED
  beq .clear_line
  ; увеличиваем скроллинг на 8 пикселей
  lda SCROLL_TARGET_POS
  clc
  adc #8
  ; если дошли до 240й строки, обнуляем
  cmp #240
  bne .not_next_nt
  lda #0
.not_next_nt:
  sta SCROLL_TARGET_POS
  ; очищаем строку на противоположном nametable
.clear_line:
  jsr wait_blank
  bit PPUSTATUS
  lda TEXT_NAMETABLE
  bne .second_nametable
  lda TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$28
  jmp .write_nametable_hi
.second_nametable:
  lda TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$20
.write_nametable_hi
  sta PPUADDR
  lda TEXT_LINE
  asl A
  asl A
  asl A
  asl A
  asl A  
  sta PPUADDR
  ldx #32
  lda #0
.next_char:
  sta PPUDATA
  dex
  bne .next_char
.end:
  jsr wait_blank
  rts

title_palette:
  .incbin "title_palette_0.bin"
  .incbin "title_palette_1.bin"
  .incbin "title_palette_2.bin"
  .incbin "title_palette_3.bin"

frame_0_palette:
  .incbin "frame_0_palette_0.bin"
  .incbin "frame_0_palette_1.bin"
  .incbin "frame_0_palette_2.bin"
  .incbin "frame_0_palette_3.bin"

frame_1_palette:
  .incbin "frame_1_palette_0.bin"
  .incbin "frame_1_palette_1.bin"
  .incbin "frame_1_palette_2.bin"
  .incbin "frame_1_palette_3.bin"

frame_2_palette:
  .incbin "frame_2_palette_0.bin"
  .incbin "frame_2_palette_1.bin"
  .incbin "frame_2_palette_2.bin"
  .incbin "frame_2_palette_3.bin"

credits_palette:
  .incbin "credits_palette_0.bin"
  .incbin "credits_palette_1.bin"
  .incbin "credits_palette_2.bin"
  .incbin "credits_palette_3.bin"

symbols_palette:
  .incbin "symbols_palette.bin"
  .db 0, 0, 0, 0
  .db 0, 0, 0, 0
  .db 0, 0, 0, 0

text_0:
  .incbin "text_0.bin"

text_1:
  .incbin "text_1.bin"

text_2:
  .incbin "text_2.bin"

text_3:
  .incbin "text_3.bin"
