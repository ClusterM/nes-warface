  .bank 16
  .org $0000
title_pattern:
  .incbin "title_pattern_0.bin"
  .org $1000
  .incbin "title_pattern_1.bin"  
  .bank 17
  .org $0000
  .incbin "title_pattern_2.bin"
  .org $1000
  .incbin "title_pattern_3.bin"

  .bank 18
  .org $0000
frame_0_pattern:
  .incbin "frame_0_pattern_0.bin"
  .org $1000
  .incbin "frame_0_pattern_1.bin"  
  .bank 19
  .org $0000
  .incbin "frame_0_pattern_2.bin"
  .org $1000
  .incbin "frame_0_pattern_3.bin"

  .bank 20
  .org $0000
frame_1_pattern:
  .incbin "frame_1_pattern_0.bin"
  .org $1000
  .incbin "frame_1_pattern_1.bin"  
  .bank 21
  .org $0000
  .incbin "frame_1_pattern_2.bin"
  .org $1000
  .incbin "frame_1_pattern_3.bin"

  .bank 22
  .org $0000
frame_2_pattern:
  .incbin "frame_2_pattern_0.bin"
  .org $1000
  .incbin "frame_2_pattern_1.bin"  
  .bank 23
  .org $0000
  .incbin "frame_2_pattern_2.bin"
  .org $1000
  .incbin "frame_2_pattern_3.bin"

  .bank 24
  .org $0000
credits_pattern:
  .incbin "credits_pattern_0.bin"
  .org $1000
  .incbin "credits_pattern_1.bin"  
  .bank 25
  .org $0000
  .incbin "credits_pattern_2.bin"
  .org $1000
  .incbin "credits_pattern_3.bin"

  .bank 31
  .org $1000
  .incbin "symbols_pattern.bin"
  .db 0, 0, 0, 0, 0, 0, 0, 0
  .db 0, 0, 0, 0, 0, 0, 0, 0
  .org $1C00
  .incbin "warface_logo_pattern.bin"
