  .bank 2
  .org $8000
  
title_name_table:
  .incbin "title_name_table_0.bin"
  .incbin "title_name_table_1.bin"
  .incbin "title_name_table_2.bin"
  .incbin "title_name_table_3.bin"
  .incbin "title_attr_table_0.bin"
  .incbin "title_attr_table_1.bin"
  .incbin "title_attr_table_2.bin"
  .incbin "title_attr_table_3.bin"

  .bank 16
  .org $0000
  .incbin "title_pattern_0.bin"
  .org $1000
  .incbin "title_pattern_1.bin"
  .bank 17
  .org $0000
  .incbin "title_pattern_2.bin"
  .org $1000
  .incbin "title_pattern_3.bin"


  .bank 31
  .db 0
