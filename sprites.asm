logo_x .equ 220
logo_y .equ 10

sprites_data:

  .db $FF, $FF, $FF, $FF
  .db logo_y, $C0, %00100001, logo_x
  .db logo_y, $C1, %00100001, logo_x+8
  .db logo_y, $C1, %01100001, logo_x+16
  .db logo_y, $C0, %01100001, logo_x+24  
  .db logo_y+8, $C2, %00100001, logo_x
  .db logo_y+8, $C3, %00100001, logo_x+8
  .db logo_y+8, $C3, %01100001, logo_x+16
  .db logo_y+8, $C2, %01100001, logo_x+24
  .db logo_y+16, $C2, %00100001, logo_x
  .db logo_y+16, $C4, %00100001, logo_x+8
  .db logo_y+16, $C4, %01100001, logo_x+16
  .db logo_y+16, $C2, %01100001, logo_x+24
  .db logo_y+24, $C5, %00100001, logo_x
  .db logo_y+24, $C6, %00100001, logo_x+8
  .db logo_y+24, $C6, %01100001, logo_x+16
  .db logo_y+24, $C5, %01100001, logo_x+24

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF

  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF
