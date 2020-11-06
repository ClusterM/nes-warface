module WarfaceMapper
(
   input m2,
	input romsel,
	input cpu_rw,
	input ppu_rd,
	input ppu_wr,
	
	input cpu_a0,
	input cpu_a13,
	input cpu_a14,
	input [7:0] cpu_data,
	output [16:13] prg_addr,
	output prg_ce,
	output prg_oe,
	output prg_prog,
	
	input [13:10] ppu_addr_in,
	output [16:10] ppu_addr_out,
	output chr_ce,
	output chr_oe,
	output chr_prog,	
	
	output ciram_a10,	
	output irq
);

// scanline counter, counts dummy PPU reads, detects v-blank automatically
reg [3:0] ppu_rd_hi_time = 0;       // counts how long there is no reads from PPU to detect v-blank
reg [1:0] ppu_nt_read_count;        // nametable read counter
reg [7:0] scanline = 0;             // current scanline
reg new_screen = 0;                 // stores 1 when v-blank detected ("in frame" flag)
reg new_screen_clear = 0;           // flag to clear new_screen flag

assign prg_ce = romsel;
assign prg_oe = romsel | !cpu_rw;
assign prg_prog = romsel | cpu_rw;

reg [2:0] prg_bank;
assign prg_addr = cpu_a14 
	? {3'b111, cpu_a13} // fixed last bank @ $C000-$FFFF
	: {prg_bank, cpu_a13}; // selectable @ $8000-$BFFF

assign chr_ce = ppu_addr_in[13];
assign chr_oe = ppu_addr_in[13] | ppu_rd;
assign chr_prog = ppu_addr_in[13] | ppu_wr;

reg prg_auto_switch = 0;
reg [4:0] chr_bank;
reg [1:0] chr_latch;
assign ppu_addr_out[16:10] = !ppu_addr_in[12] 
	? (
	   prg_auto_switch
		? {chr_bank[4:2], chr_latch[1:0], ppu_addr_in[11:10]} // $0000-$0FFF is autoswitchable
		: {chr_bank[4:0], ppu_addr_in[11:10]} // $0000-$0FFF is switchable manually
	)
	: {5'b11111, ppu_addr_in[11:10]}; // $1000-$1FFF is fixed to last

assign ciram_a10 = ppu_addr_in[11]; // horizontal mirroring

reg [13:0] timer = 0;
reg timer_elapsed = 0;
assign irq = timer_elapsed ? 1'b0 : 1'bZ;

always @ (negedge m2)
begin
  if (timer != 0)
  begin
    timer = timer - 1'b1;
	 if (timer == 0) timer_elapsed = 1;
  end
  if (romsel && !cpu_rw && cpu_a13 && cpu_a14) // write to $6000-$7FFF
  begin
    if (!cpu_a0)
	 begin // even
	   prg_bank[2:0] = cpu_data[2:0];
	   if (cpu_data[7]) timer = 4095;
		timer_elapsed = 0;
	 end else begin // odd
	   prg_auto_switch = cpu_data[7];
		chr_bank[4:0] = cpu_data[4:0];
	 end
  end 
end

// V-blank detector  
always @ (negedge m2, negedge ppu_rd)
begin
   if (~ppu_rd)
   begin
      ppu_rd_hi_time = 0;
      if (new_screen_clear) new_screen = 0;
   end else if (ppu_rd_hi_time < 4'b1111)
   begin
      // Counting how long there is no PPU reads
      ppu_rd_hi_time = ppu_rd_hi_time + 1'b1;
   end else begin
      // Too long, v-blank detected
      new_screen = 1;
   end
end   

// Scanline counter
always @ (negedge ppu_rd)
begin 
   if (!new_screen && new_screen_clear) new_screen_clear = 0;
   if (new_screen & !new_screen_clear)
   begin
      scanline = 0;        
      new_screen_clear = 1;
      chr_latch = 0;
   end else 
   if (ppu_addr_in[13:12] == 2'b10)
   begin
      if (ppu_nt_read_count < 3)
      begin
         ppu_nt_read_count = ppu_nt_read_count + 1'b1;
      end else begin
			if (scanline == 64) chr_latch = 1;
			if (scanline == 128) chr_latch = 2;
			if (scanline == 192) chr_latch = 3;
         scanline = scanline + 1'b1;
      end
   end else begin
      ppu_nt_read_count = 0;
   end
end

endmodule