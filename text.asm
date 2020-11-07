print_text:
  jsr wait_blank
  ; выключаем PPU
  jsr disable_ppu
  ; выбираем последний CHR банк
  lda #%00011111
  jsr select_chr_solid_bank
  ; очищаем экран
  jsr clear_screen
  ; загружаем палитру
  lda #LOW(symbols_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta <PAL_SOURCE_ADDR+1
  jsr preload_palette
  jsr wait_blank_simple
  jsr load_palette
  lda #3
  sta <TEXT_LINE
  lda #1
  sta <TEXT_POS
  sta SPRITES_ENABLED
  lda #0
  sta <TEXT_NAMETABLE
  sta <TEXT_SCROLL_STARTED
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
  lda <KONAMI_CODE_TRIGGERED
  bne .exit_to_credits
.inc_source_pos:
  inc <TEXT_SOURCE_ADDR
  bne .inc_text_pos
  inc <TEXT_SOURCE_ADDR+1
.inc_text_pos:
  inc <TEXT_POS
  jmp .next_char
.end:
  lda <THE_END
  beq .not_the_end
.endless_loop:
  jsr wait_blank
  lda <KONAMI_CODE_TRIGGERED
  bne .exit_to_credits
  jmp .endless_loop
.not_the_end
  jsr wait_buttons_not_pressed
  jsr wait_any_button
  lda #0
  sta SPRITES_ENABLED
  lda #LOW(symbols_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta <PAL_SOURCE_ADDR+1
  jsr dim_out
  rts
.exit_to_credits:
  lda #0
  sta SPRITES_ENABLED
  lda #LOW(symbols_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(symbols_palette)
  sta <PAL_SOURCE_ADDR+1
  jsr dim_out
  jmp credits

  ; определяем адрес, куда писать символ
symbol_address:
  pha
  bit PPUSTATUS
  lda <TEXT_NAMETABLE
  bne .second_nametable
  lda <TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$20  
  jmp .write_nametable_hi
.second_nametable:
  lda <TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$28
.write_nametable_hi
  sta PPUADDR
  lda <TEXT_LINE
  asl A
  asl A
  asl A
  asl A
  asl A
  ora <TEXT_POS
  sta PPUADDR
  pla
  rts

  ; печать символа из регистра A
symbol_print:
  pha
  ; при удержании любой кнопки ускоряем
  lda <BUTTONS
  bne .skip_sprite_draw
  
  ; настраиваем спрайт
  lda #$FF
  sta SPRITES
  pla
  sta SPRITES+1
  pha
  lda #0
  sta SPRITES+2
  lda <TEXT_POS
  asl A
  asl A
  asl A
  sta SPRITES+3
  jsr wait_blank
  lda #0
  sta OAMADDR
  lda #HIGH(SPRITES)
  sta OAMDMA

  ; плавно увеличиваем яркость
  jsr preload_palette
  jsr dim_4
  jsr dim_4
  jsr wait_blank
  jsr .set_sprite_y
  jsr load_sprite_palette

  jsr preload_palette
  jsr dim_4
  jsr wait_blank
  jsr .set_sprite_y
  jsr load_sprite_palette

  ; скрываем спрайт
  lda #$FF
  sta SPRITES
  jsr wait_blank
  lda #0
  sta OAMADDR
  lda #HIGH(SPRITES)
  sta OAMDMA
.skip_sprite_draw:
  ; вычисляем адреса
  jsr symbol_address
  pla
  ; печатаем символ
  sta PPUDATA
  inc <SYMBOL_COUNTER
  ; если зажата кнопка, то ждём vlank раз в 4 символа
  lda <BUTTONS
  beq .not_skip_vblank
  lda <SYMBOL_COUNTER
  and #%11
  bne .skip_vblank
.not_skip_vblank:
  jsr wait_blank
.skip_vblank:
  rts

.set_sprite_y:
  lda <TEXT_LINE
  asl A
  asl A
  asl A
  sec
  sbc <SCROLL_POS
  bcs .not_ovf
  sec
  sbc #16
.not_ovf
  sec
  sbc #1
  ldx <SCROLL_POS
  cpx <SCROLL_TARGET_POS
  beq .not_scrolling
  sec
  sbc #1
.not_scrolling:
  sta SPRITES
  lda #0
  sta OAMADDR
  lda #HIGH(SPRITES)
  sta OAMDMA
  rts

  ; переход на следующую строку
next_line:
  jsr wait_blank
  lda #0
  sta <TEXT_POS
  ; увеличиваем номер строки
  inc <TEXT_LINE
  lda <TEXT_LINE
  ; если он равен 30...
  cmp #30
  bne .scroll_check
  ; обнуляем строку
  lda #0
  sta <TEXT_LINE
  ; меняем nametable
  lda TEXT_NAMETABLE
  eor #1
  sta <TEXT_NAMETABLE
  ; проверка, не пора ли начинать скроллинг
.scroll_check:
  lda <TEXT_LINE
  cmp #27 ; на какой строке начинать скроллить
  bne .not_scroll_start
  ; пора
  inc <TEXT_SCROLL_STARTED
.not_scroll_start:
  ; включен ли сейчас скроллиг?
  lda <TEXT_SCROLL_STARTED
  beq .clear_line
  ; увеличиваем скроллинг на 8 пикселей
  lda <SCROLL_TARGET_POS
  clc
  adc #8
  ; если дошли до 240й строки, обнуляем
  cmp #240
  bne .not_next_nt
  lda #0
.not_next_nt:
  sta <SCROLL_TARGET_POS
  ; очищаем строку на противоположном nametable
.clear_line:
  jsr wait_blank
  bit PPUSTATUS
  lda <TEXT_NAMETABLE
  bne .second_nametable
  lda <TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$28
  jmp .write_nametable_hi
.second_nametable:
  lda <TEXT_LINE
  lsr A
  lsr A
  lsr A
  clc
  adc #$20
.write_nametable_hi
  sta PPUADDR
  lda <TEXT_LINE
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
