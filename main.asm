main:
  ; выключаем пока что PPU, но оставляем NMI
  lda #%10000000
  sta PPUCTRL
  lda #%00000000
  sta PPUMASK
  jsr wait_blank_simple
  ; загружаем чёрную палитру
  jsr load_black

  ; определяем тип консоли
  ; отключаем NMI
  lda #%00000000 
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
  jsr wait_blank
  lda #0
  sta OAMADDR
  lda #HIGH(SPRITES)  
  sta OAMDMA

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
   ; музыка
  jsr init_music

  ; небольшая пауза после включения
  ldx #30
  jsr wait_blank_x

  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(title_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(title_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(title_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(title_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(title_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(title_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
  ; музыка и чтение кнопок
  cli
  ; ждём любую кнопку  
  jsr pause
  ; убавляем яркость
  jsr dim_out

  jsr wait_blank
  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(frame_0_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(frame_0_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(frame_0_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(frame_0_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(frame_0_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(frame_0_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
  ; ждём любую кнопку  
  jsr pause
  ; убавляем яркость
  jsr dim_out

  ; отображаем текст
  lda #LOW(text_0)
  sta <TEXT_SOURCE_ADDR
  lda #HIGH(text_0)
  sta <TEXT_SOURCE_ADDR+1
  jsr print_text

  jsr wait_blank
  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(frame_1_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(frame_1_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(frame_1_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(frame_1_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(frame_1_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(frame_1_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
  ; ждём любую кнопку  
  jsr pause
  ; убавляем яркость
  jsr dim_out

  ; отображаем текст
  lda #LOW(text_1)
  sta <TEXT_SOURCE_ADDR
  lda #HIGH(text_1)
  sta <TEXT_SOURCE_ADDR+1
  jsr print_text

  jsr wait_blank
  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(frame_2_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(frame_2_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(frame_2_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(frame_2_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(frame_2_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(frame_2_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
  ; ждём любую кнопку  
  jsr pause
  ; убавляем яркость
  jsr dim_out

  ; отображаем текст
  lda #LOW(text_2)
  sta <TEXT_SOURCE_ADDR
  lda #HIGH(text_2)
  sta <TEXT_SOURCE_ADDR+1
  jsr print_text

  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(frame_3_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(frame_3_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(frame_3_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(frame_3_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(frame_3_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(frame_3_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
  ; ждём любую кнопку  
  jsr pause
  ; убавляем яркость
  jsr dim_out

  ; отображаем текст
  lda #LOW(text_3)
  sta <TEXT_SOURCE_ADDR
  lda #HIGH(text_3)
  sta <TEXT_SOURCE_ADDR+1
  lda #1
  sta <THE_END
  jsr print_text
  
  ; конец

  ; авторы проекта
credits:
  jsr disable_ppu
  ; обнуляем скроллинг
  jsr reset_scroll
  ; загружаем nametable
  lda #LOW(credits_name_table)
  sta <COPY_SOURCE_ADDR
  lda #HIGH(credits_name_table)
  sta <COPY_SOURCE_ADDR+1
  lda #BANK(credits_name_table)/2
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  lda #(BANK(credits_pattern)-16)*2
  jsr select_chr_auto_bank
  ; включаем PPU
  jsr enable_ppu
  ; загружаем палитру
  lda #LOW(credits_palette)
  sta <PAL_SOURCE_ADDR
  lda #HIGH(credits_palette)
  sta <PAL_SOURCE_ADDR+1
  ; плавно прибавляем яркость
  jsr dim_in
.loop:
  jsr wait_blank
  jmp .loop
