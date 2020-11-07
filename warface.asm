;
; Автор: Авдюхин Алексей / clusterrr@clusterrr.com / http://clusterrr.com
; Специально для Mail.ru Group
;

; INES header
  .inesprg 128 * 1024  ; 16 банков PRG
  .ineschr 128 * 1024  ; 16 банков CHR
  .inesmir 0      ; горизонтальный мирроринг
  .inesmap 3914   ; маппер #3914 (кастомный)
  
PPUCTRL   .equ $2000
PPUMASK   .equ $2001
PPUSTATUS .equ $2002
OAMADDR   .equ $2003
OAMDATA   .equ $2004
PPUSCROLL .equ $2005
PPUADDR   .equ $2006
PPUDATA   .equ $2007
OAMDMA    .equ $4014

  .rsset $0020 ; адрес для переменных
COPY_SOURCE_ADDR    .rs 2 ; исходный адрес для копирования данный
COPY_DEST_ADDR      .rs 2 ; целевой адрес для копирования данный
FRAMES              .rs 1 ; счётчик NMI
ACTIVE_BANK         .rs 1 ; текущий PRG банк
CONSOLE_TYPE        .rs 1 ; тип консоли
PAL_SOURCE_ADDR     .rs 2 ; исходный адрес для загрузки палитры
PALETTE_CACHE       .rs 16 ; кеш для временного хранения палитры
SPRITES_ENABLED     .rs 1 ; включены ли спрайты
TEXT_SOURCE_ADDR    .rs 2 ; исходный адрес текста
TEXT_LINE           .rs 1 ; текущая строка текста на экране
TEXT_POS            .rs 2 ; текущая позиция текста в строке
TEXT_NAMETABLE      .rs 1 ; текущий nametable для текста
TEXT_SCROLL_STARTED .rs 1 ; флаг, что запущен автоскроллинг
SCROLL_POS          .rs 1 ; текущая позиция скроллинга
SCROLL_NT           .rs 1 ; текущий nametable скроллинга
SCROLL_TARGET_POS   .rs 1 ; целевая позиция скроллинга
THE_END             .rs 1 ; флаг, что пора зациклить
BUTTONS             .rs 1 ; currently pressed buttons
BUTTONS_TMP         .rs 1 ; temporary variable for buttons
LAST_KONAMI_BUTTON  .rs 1 ; last button state for Konami Code check
KONAMI_CODE_STATE   .rs 1 ; Konami Code state
KONAMI_CODE_TRIGGERED .rs 1 ; Konami Code triggered flag
SYMBOL_COUNTER      .rs 1 ; счтётчик напечатанных символов

  .rsset $0400
SPRITES             .rs 256 ; тут хранятся спрайты

  .bank 12     ; PRG банк #12, середина PRG
  .org $9152
music:
  .incbin    "music.bin" ; Музыка

  .bank 15     ; PRG банк #15, конец PRG

  .org $FFFA  ; Векторы прерываний
  .dw NMI     ; NMI вектор
  .dw RESET   ; Ресет вектор $FFFA
  .dw IRQ     ; IRQ

  ; Тут начинается наш код
  .bank 15
  .org $FD00
  
RESET:
  ; сразу же отключаем любые прерывания
  sei
  ; обнуляем стек
  ldx #$ff
  txs

  ; обнуление переменных
clear_memory:
  lda #$00
  sta <COPY_SOURCE_ADDR
  sta <COPY_SOURCE_ADDR+1
  lda #0
  ldy #$02
.memory_clean_loop:
  sta [COPY_SOURCE_ADDR], y
  iny  
  bne .memory_clean_loop

  lda #BANK(main)/2
  jsr select_prg_bank
  jmp main

  ; основное прерывание по таймеру картриджа
IRQ:
  php
  pha
  tya
  pha
  txa
  pha

  ; вызываем код музыки из предпоследнего банка
  ; заодно это делает ack прерыванию
  lda #BANK(music)/2
  sta $6000
  ; играем музыку
  jsr $A99C
  ; читаем контроллер
  lda #BANK(read_controller)/2
  sta $6000
  jsr read_controller 
  ; возвращаем назад активный банк
  lda <ACTIVE_BANK
  sta $6000

  pla
  tax
  pla
  tay
  pla
  plp
  rti

  ; прерывание по vblank
NMI:
  php
  pha
  tya
  pha
  txa
  pha

  inc <FRAMES
  ; запускаем таймер в картридже
  lda <ACTIVE_BANK
  ora #%10000000
  sta $6000

  pla
  tax
  pla
  tay
  pla
  plp
  rti

  ; субрутина выбора PRG банка
select_prg_bank:
  sta <ACTIVE_BANK
  sta $6000
  rts

  ; субрутина для выбора CHR банка с автопереключением
select_chr_auto_bank:
  ora #%10000000
  sta $6001
  rts

  ; субрутина для выбора CHR банка без автопереключения
select_chr_solid_bank:
  sta $6001
  rts

  ; инициализация музыки
init_music:
  lda ACTIVE_BANK
  pha
  lda #BANK(music)/2
  jsr select_prg_bank
  ; номер трека
  lda <CONSOLE_TYPE
  ; в регистре X задаётся регион: PAL или NTSC
  ldx <CONSOLE_TYPE
  ; инициализируем музыкальный проигрыватель
  jsr $A999
  pla
  jsr select_prg_bank
  rts

  ; далее пихаем код в нулевой банк
  .bank 0
  .org $8000

enable_ppu:
  lda #%00001110
  ldx <SPRITES_ENABLED
  beq .sprites_disabled
  ora #%00010000
.sprites_disabled:
  sta PPUMASK
  jsr wait_blank_simple
  rts

disable_ppu:
  lda #%10000000
  sta PPUCTRL
  lda #%00000000
  sta PPUMASK
  jsr wait_blank_simple
  rts

  ; субрутина простого ожидания vblank
wait_blank_simple:
  pha
  lda <FRAMES
.loop:
  cmp <FRAMES
  beq .loop
  pla
  rts

  ; субрутина ожидания vblank
wait_blank:
  pha
  tya
  pha
  txa
  pha

  ; скроллим, если нужно
  lda <SCROLL_POS
  cmp <SCROLL_TARGET_POS
  beq .end_scroll
  inc <SCROLL_POS
  lda <SCROLL_POS
  cmp #240
  bne .end_scroll
  lda #0
  sta <SCROLL_POS
  lda <SCROLL_NT
  eor #1
  sta <SCROLL_NT  
.end_scroll:

  bit PPUSTATUS
  lda #0
  sta PPUSCROLL
  lda <SCROLL_POS
  sta PPUSCROLL
  lda <SCROLL_NT
  bne .second_nt
  lda #%10000000
  jmp .write_ppuctrl
.second_nt:
  lda #%10000010
.write_ppuctrl
  sta PPUCTRL

  jsr wait_blank_simple

  pla
  tax
  pla
  tay
  pla
  rts

wait_blank_x:
.loop:
  jsr wait_blank
  dex
  bne .loop
  rts

  ; загружаем nametable в $2000
  ; в A номер банка
  ; в COPY_SOURCE_ADDR - адрес данных
load_name_table:
  tax
  lda ACTIVE_BANK
  pha
  txa
  jsr select_prg_bank
  lda #$20
  sta $2006
  lda #$00
  sta $2006
  ldy #$00
  ldx #$04
.loop:
  lda [COPY_SOURCE_ADDR], y
  sta $2007
  iny
  bne .loop
  inc <COPY_SOURCE_ADDR+1
  dex
  bne .loop
  pla
  jsr select_prg_bank
  rts

reset_scroll:
  lda #0
  sta <SCROLL_POS
  sta <SCROLL_NT
  sta <SCROLL_TARGET_POS
  rts

  ; waiting for button release
wait_buttons_not_pressed:
  jsr wait_blank ; waiting for v-blank
  lda <BUTTONS
  bne wait_buttons_not_pressed
  rts

  ; waiting for any button pressed
wait_any_button:
  jsr wait_blank ; waiting for v-blank
  lda KONAMI_CODE_TRIGGERED
  bne .end
  lda <BUTTONS
  beq wait_any_button
.end
  rts

pause:
  jsr wait_buttons_not_pressed
  ;ldx #150
  ;jsr wait_blank_x
  jsr wait_any_button
  rts

  .include "main.asm"
  .include "clean.asm"
  .include "dimming.asm"
  .include "text.asm"
  .include "buttons.asm"

  .bank 1
  .org $A000

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
  .incbin "warface_palette.bin"
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

  .include "sprites.asm"
  .include "nametables.asm"
  .include "patterns.asm"
