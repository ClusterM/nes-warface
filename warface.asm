;
; Автор: Авдюхин Алексей / clusterrr@clusterrr.com / http://clusterrr.com
; Специально Mail.ru Group
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
ACTIVE_BANK         .rs 1 ; текущий PRG банк
CONSOLE_TYPE        .rs 1 ; тип консоли
COPY_SOURCE_ADDR    .rs 2
PAL_SOURCE_ADDR     .rs 2
PALETTE_CACHE       .rs 16

  .bank 12     ; PRG банк #12, середина PRG
  .org $9213
  .incbin    "music.bin" ; Музыка

  .bank 15     ; PRG банк #15, конец PRG

  .org $FFFA  ; Векторы прерываний
  .dw NMI     ; NMI вектор
  .dw Start    ; Ресет вектор $FFFA
  .dw IRQ     ; IRQ

  .bank 15     ; Тут начинается наш код
  .org $FD00  ; В памяти NES это будет адрес $8000
  
Start:
  sei ; сразу же отключаем любые прерывания
  ; обнуляем стек
  ldx #$ff
  txs 
  ; вызываем функцию инициализации из нулевого банка
  lda #BANK(init)/2
  jsr select_prg_bank
  jsr init
  ; предпоследний банк
  lda #6
  jsr select_prg_bank
  lda #0 ; номер трека
  ; в регистре X задаётся регион: PAL или NTSC
  ldx CONSOLE_TYPE
  jsr $A999  ; Инициализируем музыкальный проигрыватель

  cli
  jsr disable_ppu
  jsr wait_blank_simple
  ; загружаем nametable
  lda #BANK(title_name_table)/2
  jsr select_prg_bank
  lda #LOW(title_name_table)
  sta COPY_SOURCE_ADDR
  lda #HIGH(title_name_table)
  sta COPY_SOURCE_ADDR+1
  jsr load_name_table
  ; выбираем CHR банк с автопереключением
  jsr wait_blank_simple
  lda #0
  jsr select_chr_bank
  jsr enable_ppu
  ; загружаем палитру
  lda #BANK(title_palette)/2
  jsr select_prg_bank
  lda #LOW(title_palette)
  sta PAL_SOURCE_ADDR
  lda #HIGH(title_palette)
  sta PAL_SOURCE_ADDR+1

  ; бесконечный цикл
main_loop:
  jsr dim_in
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank

  jsr dim_out
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank
  jsr wait_blank

  jmp main_loop

IRQ:
  php
  pha
  tya
  pha
  txa
  pha

  ; вызываем код музыки из предпоследнего банка
  ; заодно это делает ack прерыванию
  lda #6
  sta $6000
  jsr $A99C      ; играем музыку
  ; возвращаем назад активный банк
  lda ACTIVE_BANK
  sta $6000

  pla
  tax
  pla
  tay
  pla
  plp
  rti
  
NMI:
  php
  pha
  tya
  pha
  txa
  pha

  ; запускаем таймер, чтобы потом играть музыку
  lda ACTIVE_BANK
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
  sta ACTIVE_BANK
  sta $6000
  rts

  ; субрутина для выбора CHR банка
select_chr_bank:
  asl A
  asl A
  ora #%10000000
  sta $6001

enable_ppu:
  bit PPUSTATUS
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  lda #%10000000
  sta PPUCTRL
  lda #%00001010
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
  bit PPUSTATUS
.loop:
  lda PPUSTATUS  ; load A with value at location $2002
  bpl .loop  ; if bit 7 is not set (not VBlank) keep checking
  pla
  rts

  ; субрутина ожидания vblank
wait_blank:
  pha
  tya
  pha
  txa
  pha

  jsr enable_ppu

  pla
  tax
  pla
  tay
  pla
  rts

wait_blank5:
  ldx #5
.loop:
  jsr wait_blank
  dex
  bne .loop
  rts

  ; загружаем nametable в $1000
load_name_table:
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
  rts

dim_in:
  lda #0
  jsr select_prg_bank
  jsr dim_in_s
  rts

dim_out:
  lda #0
  jsr select_prg_bank
  jsr dim_out_s
  rts

  .include "bank0_subroutines.asm"
  .include "nametables.asm"
