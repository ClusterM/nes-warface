  .bank 16
  .org $0000
title_pattern:
  .incbin title_pattern_0_bin
  .org $1000
  .incbin title_pattern_1_bin
  .bank 17
  .org $0000
  .incbin title_pattern_2_bin
  .org $1000
  .incbin title_pattern_3_bin

  .bank 18
  .org $0000
frame_0_pattern:
  .incbin frame_0_pattern_0_bin
  .org $1000
  .incbin frame_0_pattern_1_bin
  .bank 19
  .org $0000
  .incbin frame_0_pattern_2_bin
  .org $1000
  .incbin frame_0_pattern_3_bin

  .bank 20
  .org $0000
frame_1_pattern:
  .incbin frame_1_pattern_0_bin
  .org $1000
  .incbin frame_1_pattern_1_bin
  .bank 21
  .org $0000
  .incbin frame_1_pattern_2_bin
  .org $1000
  .incbin frame_1_pattern_3_bin

  .bank 22
  .org $0000
frame_2_pattern:
  .incbin frame_2_pattern_0_bin
  .org $1000
  .incbin frame_2_pattern_1_bin
  .bank 23
  .org $0000
  .incbin frame_2_pattern_2_bin
  .org $1000
  .incbin frame_2_pattern_3_bin

  .bank 24
  .org $0000
frame_3_pattern:
  .incbin frame_3_pattern_0_bin
  .org $1000
  .incbin frame_3_pattern_1_bin
  .bank 25
  .org $0000
  .incbin frame_3_pattern_2_bin
  .org $1000
  .incbin frame_3_pattern_3_bin

  .bank 26
  .org $0000
credits_pattern:
  .incbin credits_pattern_0_bin
  .org $1000
  .incbin credits_pattern_1_bin
  .bank 27
  .org $0000
  .incbin credits_pattern_2_bin
  .org $1000
  .incbin credits_pattern_3_bin

  .bank 31
  .org $1000
  .incbin symbols_pattern_bin
  .db 0, 0, 0, 0, 0, 0, 0, 0
  .db 0, 0, 0, 0, 0, 0, 0, 0
  .org $1C00
  .incbin warface_logo_pattern_bin
