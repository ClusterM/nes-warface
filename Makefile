STORY?=1

ifeq ($(STORY),1)
	FRAME_0_IMAGE=images/pagoda.jpg
	FRAME_1_IMAGE=images/myatej.gif
	FRAME_2_IMAGE=images/glaza.jpg
	TEXT_0=text/0_0.txt
	TEXT_1=text/0_1.txt
	TEXT_2=text/0_2.txt
	TEXT_3=text/0_3.txt
endif
ifeq ($(STORY),2)
	FRAME_0_IMAGE=images/rayon4.jpg
	FRAME_1_IMAGE=images/sputnik.jpg
	FRAME_2_IMAGE=images/sindikat.gif
	TEXT_0=text/1_0.txt
	TEXT_1=text/1_1.txt
	TEXT_2=text/1_2.txt
	TEXT_3=text/1_3.txt
endif
ifeq ($(STORY),3)
	FRAME_0_IMAGE=images/buhanka.gif 
	FRAME_1_IMAGE=images/chernobyl.gif 
	FRAME_2_IMAGE=images/sworm.jpg 
	TEXT_0=text/2_0.txt
	TEXT_1=text/2_1.txt
	TEXT_2=text/2_2.txt
	TEXT_3=text/2_3.txt
endif
ifeq ($(STORY),4)
	FRAME_0_IMAGE=images/gorgona.jpg
	FRAME_1_IMAGE=images/dira.jpg
	FRAME_2_IMAGE=images/sworm.jpg
	TEXT_0=text/3_0.txt
	TEXT_1=text/3_1.txt
	TEXT_2=text/3_2.txt
	TEXT_3=text/3_3.txt
endif
ifeq ($(STORY),5)
	FRAME_0_IMAGE=images/shkola.jpg
	FRAME_1_IMAGE=images/zapravka.jpg
	FRAME_2_IMAGE=images/sputnik.jpg
	TEXT_0=text/4_0.txt
	TEXT_1=text/4_1.txt
	TEXT_2=text/4_2.txt
	TEXT_3=text/4_3.txt
endif
ifeq ($(STORY),6)
	FRAME_0_IMAGE=images/trailer-park.jpg
	FRAME_1_IMAGE=images/belaya_akula.jpg
	FRAME_2_IMAGE=images/sworm.jpg
	TEXT_0=text/5_0.txt
	TEXT_1=text/5_1.txt
	TEXT_2=text/5_2.txt
	TEXT_3=text/5_3.txt
endif
ifeq ($(STORY),7)
	FRAME_0_IMAGE=images/myatej.gif
	FRAME_1_IMAGE=images/trailer-park.jpg
	FRAME_2_IMAGE=images/zapravka.jpg
	TEXT_0=text/6_0.txt
	TEXT_1=text/6_1.txt
	TEXT_2=text/6_2.txt
	TEXT_3=text/6_3.txt
endif

TITLE_IMAGE=images/logo_warface.jpg
CREDITS_IMAGE=images/credits.png
SYMBOLS_IMAGE=images/symbols.png

NESASM=tools/NESASM.EXE 
EMU=fceux
SPLITTER=tools/ImageSplitter.exe
TILER=tools/NesTiler.exe
TEXT_CONVERTER=tools/TextConverter.exe
SOURCE=warface.asm
INCLUDES=bank0_subroutines.asm nametables.asm patterns.asm buttons.asm
EXECUTABLE=warface.nes
MUSIC=Warface-11.nsf
MUSIC_BIN=music.bin

TITLE_IMAGE_0=title_0.png
TITLE_IMAGE_1=title_1.png
TITLE_IMAGE_2=title_2.png
TITLE_IMAGE_3=title_3.png

TITLE_PATTERN_0=title_pattern_0.bin
TITLE_PATTERN_1=title_pattern_1.bin
TITLE_PATTERN_2=title_pattern_2.bin
TITLE_PATTERN_3=title_pattern_3.bin
TITLE_NAME_TABLE_0=title_name_table_0.bin
TITLE_NAME_TABLE_1=title_name_table_1.bin
TITLE_NAME_TABLE_2=title_name_table_2.bin
TITLE_NAME_TABLE_3=title_name_table_3.bin
TITLE_ATTR_TABLE_0=title_attr_table_0.bin
TITLE_ATTR_TABLE_1=title_attr_table_1.bin
TITLE_ATTR_TABLE_2=title_attr_table_2.bin
TITLE_ATTR_TABLE_3=title_attr_table_3.bin
TITLE_PALETTE_0=title_palette_0.bin
TITLE_PALETTE_1=title_palette_1.bin
TITLE_PALETTE_2=title_palette_2.bin
TITLE_PALETTE_3=title_palette_3.bin

FRAME_0_IMAGE_0=frame_0_0.png
FRAME_0_IMAGE_1=frame_0_1.png
FRAME_0_IMAGE_2=frame_0_2.png
FRAME_0_IMAGE_3=frame_0_3.png
FRAME_0_PATTERN_0=frame_0_pattern_0.bin
FRAME_0_PATTERN_1=frame_0_pattern_1.bin
FRAME_0_PATTERN_2=frame_0_pattern_2.bin
FRAME_0_PATTERN_3=frame_0_pattern_3.bin
FRAME_0_NAME_TABLE_0=frame_0_name_table_0.bin
FRAME_0_NAME_TABLE_1=frame_0_name_table_1.bin
FRAME_0_NAME_TABLE_2=frame_0_name_table_2.bin
FRAME_0_NAME_TABLE_3=frame_0_name_table_3.bin
FRAME_0_ATTR_TABLE_0=frame_0_attr_table_0.bin
FRAME_0_ATTR_TABLE_1=frame_0_attr_table_1.bin
FRAME_0_ATTR_TABLE_2=frame_0_attr_table_2.bin
FRAME_0_ATTR_TABLE_3=frame_0_attr_table_3.bin
FRAME_0_PALETTE_0=frame_0_palette_0.bin
FRAME_0_PALETTE_1=frame_0_palette_1.bin
FRAME_0_PALETTE_2=frame_0_palette_2.bin
FRAME_0_PALETTE_3=frame_0_palette_3.bin

FRAME_1_IMAGE_0=frame_1_0.png
FRAME_1_IMAGE_1=frame_1_1.png
FRAME_1_IMAGE_2=frame_1_2.png
FRAME_1_IMAGE_3=frame_1_3.png
FRAME_1_PATTERN_0=frame_1_pattern_0.bin
FRAME_1_PATTERN_1=frame_1_pattern_1.bin
FRAME_1_PATTERN_2=frame_1_pattern_2.bin
FRAME_1_PATTERN_3=frame_1_pattern_3.bin
FRAME_1_NAME_TABLE_0=frame_1_name_table_0.bin
FRAME_1_NAME_TABLE_1=frame_1_name_table_1.bin
FRAME_1_NAME_TABLE_2=frame_1_name_table_2.bin
FRAME_1_NAME_TABLE_3=frame_1_name_table_3.bin
FRAME_1_ATTR_TABLE_0=frame_1_attr_table_0.bin
FRAME_1_ATTR_TABLE_1=frame_1_attr_table_1.bin
FRAME_1_ATTR_TABLE_2=frame_1_attr_table_2.bin
FRAME_1_ATTR_TABLE_3=frame_1_attr_table_3.bin
FRAME_1_PALETTE_0=frame_1_palette_0.bin
FRAME_1_PALETTE_1=frame_1_palette_1.bin
FRAME_1_PALETTE_2=frame_1_palette_2.bin
FRAME_1_PALETTE_3=frame_1_palette_3.bin

FRAME_2_IMAGE_0=frame_2_0.png
FRAME_2_IMAGE_1=frame_2_1.png
FRAME_2_IMAGE_2=frame_2_2.png
FRAME_2_IMAGE_3=frame_2_3.png
FRAME_2_PATTERN_0=frame_2_pattern_0.bin
FRAME_2_PATTERN_1=frame_2_pattern_1.bin
FRAME_2_PATTERN_2=frame_2_pattern_2.bin
FRAME_2_PATTERN_3=frame_2_pattern_3.bin
FRAME_2_NAME_TABLE_0=frame_2_name_table_0.bin
FRAME_2_NAME_TABLE_1=frame_2_name_table_1.bin
FRAME_2_NAME_TABLE_2=frame_2_name_table_2.bin
FRAME_2_NAME_TABLE_3=frame_2_name_table_3.bin
FRAME_2_ATTR_TABLE_0=frame_2_attr_table_0.bin
FRAME_2_ATTR_TABLE_1=frame_2_attr_table_1.bin
FRAME_2_ATTR_TABLE_2=frame_2_attr_table_2.bin
FRAME_2_ATTR_TABLE_3=frame_2_attr_table_3.bin
FRAME_2_PALETTE_0=frame_2_palette_0.bin
FRAME_2_PALETTE_1=frame_2_palette_1.bin
FRAME_2_PALETTE_2=frame_2_palette_2.bin
FRAME_2_PALETTE_3=frame_2_palette_3.bin

CREDITS_IMAGE_0=credits_0.png
CREDITS_IMAGE_1=credits_1.png
CREDITS_IMAGE_2=credits_2.png
CREDITS_IMAGE_3=credits_3.png
CREDITS_PATTERN_0=credits_pattern_0.bin
CREDITS_PATTERN_1=credits_pattern_1.bin
CREDITS_PATTERN_2=credits_pattern_2.bin
CREDITS_PATTERN_3=credits_pattern_3.bin
CREDITS_NAME_TABLE_0=credits_name_table_0.bin
CREDITS_NAME_TABLE_1=credits_name_table_1.bin
CREDITS_NAME_TABLE_2=credits_name_table_2.bin
CREDITS_NAME_TABLE_3=credits_name_table_3.bin
CREDITS_ATTR_TABLE_0=credits_attr_table_0.bin
CREDITS_ATTR_TABLE_1=credits_attr_table_1.bin
CREDITS_ATTR_TABLE_2=credits_attr_table_2.bin
CREDITS_ATTR_TABLE_3=credits_attr_table_3.bin
CREDITS_PALETTE_0=credits_palette_0.bin
CREDITS_PALETTE_1=credits_palette_1.bin
CREDITS_PALETTE_2=credits_palette_2.bin
CREDITS_PALETTE_3=credits_palette_3.bin

TEXT_0_BIN=text_0.bin
TEXT_1_BIN=text_1.bin
TEXT_2_BIN=text_2.bin
TEXT_3_BIN=text_3.bin

SYMBOLS_PATTERN=symbols_pattern.bin
SYMBOLS_PALETTE=symbols_palette.bin

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCE) $(INCLUDES) $(MUSIC_BIN) \
$(TITLE_PATTERN_0) $(TITLE_PATTERN_1) $(TITLE_PATTERN_2) $(TITLE_PATTERN_3) \
$(TITLE_NAME_TABLE_0) $(TITLE_NAME_TABLE_1) $(TITLE_NAME_TABLE_2) $(TITLE_NAME_TABLE_3) \
$(TITLE_ATTR_TABLE_0) $(TITLE_ATTR_TABLE_1) $(TITLE_ATTR_TABLE_2) $(TITLE_ATTR_TABLE_3) \
$(TITLE_PALETTE_0) $(TITLE_PALETTE_1) $(TITLE_PALETTE_2) $(TITLE_PALETTE_3) \
$(FRAME_0_PATTERN_0) $(FRAME_0_PATTERN_1) $(FRAME_0_PATTERN_2) $(FRAME_0_PATTERN_3) \
$(FRAME_0_NAME_TABLE_0) $(FRAME_0_NAME_TABLE_1) $(FRAME_0_NAME_TABLE_2) $(FRAME_0_NAME_TABLE_3) \
$(FRAME_0_ATTR_TABLE_0) $(FRAME_0_ATTR_TABLE_1) $(FRAME_0_ATTR_TABLE_2) $(FRAME_0_ATTR_TABLE_3) \
$(FRAME_0_PALETTE_0) $(FRAME_0_PALETTE_1) $(FRAME_0_PALETTE_2) $(FRAME_0_PALETTE_3) \
$(FRAME_1_PATTERN_0) $(FRAME_1_PATTERN_1) $(FRAME_1_PATTERN_2) $(FRAME_1_PATTERN_3) \
$(FRAME_1_NAME_TABLE_0) $(FRAME_1_NAME_TABLE_1) $(FRAME_1_NAME_TABLE_2) $(FRAME_1_NAME_TABLE_3) \
$(FRAME_1_ATTR_TABLE_0) $(FRAME_1_ATTR_TABLE_1) $(FRAME_1_ATTR_TABLE_2) $(FRAME_1_ATTR_TABLE_3) \
$(FRAME_1_PALETTE_0) $(FRAME_1_PALETTE_1) $(FRAME_1_PALETTE_2) $(FRAME_1_PALETTE_3) \
$(FRAME_2_PATTERN_0) $(FRAME_2_PATTERN_1) $(FRAME_2_PATTERN_2) $(FRAME_2_PATTERN_3) \
$(FRAME_2_NAME_TABLE_0) $(FRAME_2_NAME_TABLE_1) $(FRAME_2_NAME_TABLE_2) $(FRAME_2_NAME_TABLE_3) \
$(FRAME_2_ATTR_TABLE_0) $(FRAME_2_ATTR_TABLE_1) $(FRAME_2_ATTR_TABLE_2) $(FRAME_2_ATTR_TABLE_3) \
$(FRAME_2_PALETTE_0) $(FRAME_2_PALETTE_1) $(FRAME_2_PALETTE_2) $(FRAME_2_PALETTE_3) \
$(CREDITS_PATTERN_0) $(CREDITS_PATTERN_1) $(CREDITS_PATTERN_2) $(CREDITS_PATTERN_3) \
$(CREDITS_NAME_TABLE_0) $(CREDITS_NAME_TABLE_1) $(CREDITS_NAME_TABLE_2) $(CREDITS_NAME_TABLE_3) \
$(CREDITS_ATTR_TABLE_0) $(CREDITS_ATTR_TABLE_1) $(CREDITS_ATTR_TABLE_2) $(CREDITS_ATTR_TABLE_3) \
$(CREDITS_PALETTE_0) $(CREDITS_PALETTE_1) $(CREDITS_PALETTE_2) $(CREDITS_PALETTE_3) \
$(TEXT_0_BIN) $(TEXT_1_BIN) $(TEXT_2_BIN) $(TEXT_3_BIN) $(SYMBOLS_PATTERN) $(SYMBOLS_PALETTE)
	rm -f $(EXECUTABLE)
	$(NESASM) $(SOURCE) -o $(EXECUTABLE) --symbols=$(EXECUTABLE) -iWss

$(MUSIC_BIN):
	dd if=$(MUSIC) of=music.bin bs=1 skip=128

build: $(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE) *.lst *.nl *.png *.bin

run: $(EXECUTABLE)
	$(EMU) $(EXECUTABLE)

$(TITLE_IMAGE_0) $(TITLE_IMAGE_1) $(TITLE_IMAGE_2) $(TITLE_IMAGE_3): $(TITLE_IMAGE)
	$(SPLITTER) $(TITLE_IMAGE) $(TITLE_IMAGE_0) $(TITLE_IMAGE_1) $(TITLE_IMAGE_2) $(TITLE_IMAGE_3)

$(TITLE_PATTERN_0) $(TITLE_PATTERN_1) $(TITLE_PATTERN_2) $(TITLE_PATTERN_3) $(TITLE_NAME_TABLE_0) $(TITLE_NAME_TABLE_1) $(TITLE_NAME_TABLE_2) $(TITLE_NAME_TABLE_3) $(TITLE_ATTR_TABLE_0) $(TITLE_ATTR_TABLE_1) $(TITLE_ATTR_TABLE_2) $(TITLE_ATTR_TABLE_3) $(TITLE_PALETTE_0) $(TITLE_PALETTE_1) $(TITLE_PALETTE_2) $(TITLE_PALETTE_3): $(TITLE_IMAGE_0) $(TITLE_IMAGE_1) $(TITLE_IMAGE_2) $(TITLE_IMAGE_3)
	$(TILER) -i0 $(TITLE_IMAGE_0) -i1 $(TITLE_IMAGE_1) -i2 $(TITLE_IMAGE_2) -i3 $(TITLE_IMAGE_3) --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(TITLE_PATTERN_0) --out-pattern-table1 $(TITLE_PATTERN_1) --out-pattern-table2 $(TITLE_PATTERN_2) --out-pattern-table3 $(TITLE_PATTERN_3) \
	--out-name-table0 $(TITLE_NAME_TABLE_0) --out-name-table1 $(TITLE_NAME_TABLE_1) --out-name-table2 $(TITLE_NAME_TABLE_2) --out-name-table3 $(TITLE_NAME_TABLE_3) \
	--out-attribute-table0 $(TITLE_ATTR_TABLE_0) --out-attribute-table1 $(TITLE_ATTR_TABLE_1) --out-attribute-table2 $(TITLE_ATTR_TABLE_2) --out-attribute-table3 $(TITLE_ATTR_TABLE_3) \
	--out-palette0 $(TITLE_PALETTE_0) --out-palette1 $(TITLE_PALETTE_1) --out-palette2 $(TITLE_PALETTE_2) --out-palette3 $(TITLE_PALETTE_3)

$(FRAME_0_IMAGE_0) $(FRAME_0_IMAGE_1) $(FRAME_0_IMAGE_2) $(FRAME_0_IMAGE_3): $(FRAME_0_IMAGE)
	$(SPLITTER) $(FRAME_0_IMAGE) $(FRAME_0_IMAGE_0) $(FRAME_0_IMAGE_1) $(FRAME_0_IMAGE_2) $(FRAME_0_IMAGE_3)

$(FRAME_0_PATTERN_0) $(FRAME_0_PATTERN_1) $(FRAME_0_PATTERN_2) $(FRAME_0_PATTERN_3) $(FRAME_0_NAME_TABLE_0) $(FRAME_0_NAME_TABLE_1) $(FRAME_0_NAME_TABLE_2) $(FRAME_0_NAME_TABLE_3) $(FRAME_0_ATTR_TABLE_0) $(FRAME_0_ATTR_TABLE_1) $(FRAME_0_ATTR_TABLE_2) $(FRAME_0_ATTR_TABLE_3) $(FRAME_0_PALETTE_0) $(FRAME_0_PALETTE_1) $(FRAME_0_PALETTE_2) $(FRAME_0_PALETTE_3): $(FRAME_0_IMAGE_0) $(FRAME_0_IMAGE_1) $(FRAME_0_IMAGE_2) $(FRAME_0_IMAGE_3)
	$(TILER) -i0 $(FRAME_0_IMAGE_0) -i1 $(FRAME_0_IMAGE_1) -i2 $(FRAME_0_IMAGE_2) -i3 $(FRAME_0_IMAGE_3) --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_0_PATTERN_0) --out-pattern-table1 $(FRAME_0_PATTERN_1) --out-pattern-table2 $(FRAME_0_PATTERN_2) --out-pattern-table3 $(FRAME_0_PATTERN_3) \
	--out-name-table0 $(FRAME_0_NAME_TABLE_0) --out-name-table1 $(FRAME_0_NAME_TABLE_1) --out-name-table2 $(FRAME_0_NAME_TABLE_2) --out-name-table3 $(FRAME_0_NAME_TABLE_3) \
	--out-attribute-table0 $(FRAME_0_ATTR_TABLE_0) --out-attribute-table1 $(FRAME_0_ATTR_TABLE_1) --out-attribute-table2 $(FRAME_0_ATTR_TABLE_2) --out-attribute-table3 $(FRAME_0_ATTR_TABLE_3) \
	--out-palette0 $(FRAME_0_PALETTE_0) --out-palette1 $(FRAME_0_PALETTE_1) --out-palette2 $(FRAME_0_PALETTE_2) --out-palette3 $(FRAME_0_PALETTE_3)

$(FRAME_1_IMAGE_0) $(FRAME_1_IMAGE_1) $(FRAME_1_IMAGE_2) $(FRAME_1_IMAGE_3): $(FRAME_1_IMAGE)
	$(SPLITTER) $(FRAME_1_IMAGE) $(FRAME_1_IMAGE_0) $(FRAME_1_IMAGE_1) $(FRAME_1_IMAGE_2) $(FRAME_1_IMAGE_3)

$(FRAME_1_PATTERN_0) $(FRAME_1_PATTERN_1) $(FRAME_1_PATTERN_2) $(FRAME_1_PATTERN_3) $(FRAME_1_NAME_TABLE_0) $(FRAME_1_NAME_TABLE_1) $(FRAME_1_NAME_TABLE_2) $(FRAME_1_NAME_TABLE_3) $(FRAME_1_ATTR_TABLE_0) $(FRAME_1_ATTR_TABLE_1) $(FRAME_1_ATTR_TABLE_2) $(FRAME_1_ATTR_TABLE_3) $(FRAME_1_PALETTE_0) $(FRAME_1_PALETTE_1) $(FRAME_1_PALETTE_2) $(FRAME_1_PALETTE_3): $(FRAME_1_IMAGE_0) $(FRAME_1_IMAGE_1) $(FRAME_1_IMAGE_2) $(FRAME_1_IMAGE_3)
	$(TILER) -i0 $(FRAME_1_IMAGE_0) -i1 $(FRAME_1_IMAGE_1) -i2 $(FRAME_1_IMAGE_2) -i3 $(FRAME_1_IMAGE_3) --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_1_PATTERN_0) --out-pattern-table1 $(FRAME_1_PATTERN_1) --out-pattern-table2 $(FRAME_1_PATTERN_2) --out-pattern-table3 $(FRAME_1_PATTERN_3) \
	--out-name-table0 $(FRAME_1_NAME_TABLE_0) --out-name-table1 $(FRAME_1_NAME_TABLE_1) --out-name-table2 $(FRAME_1_NAME_TABLE_2) --out-name-table3 $(FRAME_1_NAME_TABLE_3) \
	--out-attribute-table0 $(FRAME_1_ATTR_TABLE_0) --out-attribute-table1 $(FRAME_1_ATTR_TABLE_1) --out-attribute-table2 $(FRAME_1_ATTR_TABLE_2) --out-attribute-table3 $(FRAME_1_ATTR_TABLE_3) \
	--out-palette0 $(FRAME_1_PALETTE_0) --out-palette1 $(FRAME_1_PALETTE_1) --out-palette2 $(FRAME_1_PALETTE_2) --out-palette3 $(FRAME_1_PALETTE_3)

$(FRAME_2_IMAGE_0) $(FRAME_2_IMAGE_1) $(FRAME_2_IMAGE_2) $(FRAME_2_IMAGE_3): $(FRAME_2_IMAGE)
	$(SPLITTER) $(FRAME_2_IMAGE) $(FRAME_2_IMAGE_0) $(FRAME_2_IMAGE_1) $(FRAME_2_IMAGE_2) $(FRAME_2_IMAGE_3)

$(FRAME_2_PATTERN_0) $(FRAME_2_PATTERN_1) $(FRAME_2_PATTERN_2) $(FRAME_2_PATTERN_3) $(FRAME_2_NAME_TABLE_0) $(FRAME_2_NAME_TABLE_1) $(FRAME_2_NAME_TABLE_2) $(FRAME_2_NAME_TABLE_3) $(FRAME_2_ATTR_TABLE_0) $(FRAME_2_ATTR_TABLE_1) $(FRAME_2_ATTR_TABLE_2) $(FRAME_2_ATTR_TABLE_3) $(FRAME_2_PALETTE_0) $(FRAME_2_PALETTE_1) $(FRAME_2_PALETTE_2) $(FRAME_2_PALETTE_3): $(FRAME_2_IMAGE_0) $(FRAME_2_IMAGE_1) $(FRAME_2_IMAGE_2) $(FRAME_2_IMAGE_3)
	$(TILER) -i0 $(FRAME_2_IMAGE_0) -i1 $(FRAME_2_IMAGE_1) -i2 $(FRAME_2_IMAGE_2) -i3 $(FRAME_2_IMAGE_3) --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_2_PATTERN_0) --out-pattern-table1 $(FRAME_2_PATTERN_1) --out-pattern-table2 $(FRAME_2_PATTERN_2) --out-pattern-table3 $(FRAME_2_PATTERN_3) \
	--out-name-table0 $(FRAME_2_NAME_TABLE_0) --out-name-table1 $(FRAME_2_NAME_TABLE_1) --out-name-table2 $(FRAME_2_NAME_TABLE_2) --out-name-table3 $(FRAME_2_NAME_TABLE_3) \
	--out-attribute-table0 $(FRAME_2_ATTR_TABLE_0) --out-attribute-table1 $(FRAME_2_ATTR_TABLE_1) --out-attribute-table2 $(FRAME_2_ATTR_TABLE_2) --out-attribute-table3 $(FRAME_2_ATTR_TABLE_3) \
	--out-palette0 $(FRAME_2_PALETTE_0) --out-palette1 $(FRAME_2_PALETTE_1) --out-palette2 $(FRAME_2_PALETTE_2) --out-palette3 $(FRAME_2_PALETTE_3)

$(CREDITS_IMAGE_0) $(CREDITS_IMAGE_1) $(CREDITS_IMAGE_2) $(CREDITS_IMAGE_3): $(CREDITS_IMAGE)
	$(SPLITTER) $(CREDITS_IMAGE) $(CREDITS_IMAGE_0) $(CREDITS_IMAGE_1) $(CREDITS_IMAGE_2) $(CREDITS_IMAGE_3)

$(CREDITS_PATTERN_0) $(CREDITS_PATTERN_1) $(CREDITS_PATTERN_2) $(CREDITS_PATTERN_3) $(CREDITS_NAME_TABLE_0) $(CREDITS_NAME_TABLE_1) $(CREDITS_NAME_TABLE_2) $(CREDITS_NAME_TABLE_3) $(CREDITS_ATTR_TABLE_0) $(CREDITS_ATTR_TABLE_1) $(CREDITS_ATTR_TABLE_2) $(CREDITS_ATTR_TABLE_3) $(CREDITS_PALETTE_0) $(CREDITS_PALETTE_1) $(CREDITS_PALETTE_2) $(CREDITS_PALETTE_3): $(CREDITS_IMAGE_0) $(CREDITS_IMAGE_1) $(CREDITS_IMAGE_2) $(CREDITS_IMAGE_3)
	$(TILER) -i0 $(CREDITS_IMAGE_0) -i1 $(CREDITS_IMAGE_1) -i2 $(CREDITS_IMAGE_2) -i3 $(CREDITS_IMAGE_3) --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(CREDITS_PATTERN_0) --out-pattern-table1 $(CREDITS_PATTERN_1) --out-pattern-table2 $(CREDITS_PATTERN_2) --out-pattern-table3 $(CREDITS_PATTERN_3) \
	--out-name-table0 $(CREDITS_NAME_TABLE_0) --out-name-table1 $(CREDITS_NAME_TABLE_1) --out-name-table2 $(CREDITS_NAME_TABLE_2) --out-name-table3 $(CREDITS_NAME_TABLE_3) \
	--out-attribute-table0 $(CREDITS_ATTR_TABLE_0) --out-attribute-table1 $(CREDITS_ATTR_TABLE_1) --out-attribute-table2 $(CREDITS_ATTR_TABLE_2) --out-attribute-table3 $(CREDITS_ATTR_TABLE_3) \
	--out-palette0 $(CREDITS_PALETTE_0) --out-palette1 $(CREDITS_PALETTE_1) --out-palette2 $(CREDITS_PALETTE_2) --out-palette3 $(CREDITS_PALETTE_3)

$(TEXT_0_BIN): $(TEXT_0)
	$(TEXT_CONVERTER) $(TEXT_0) $(TEXT_0_BIN)

$(TEXT_1_BIN): $(TEXT_1)
	$(TEXT_CONVERTER) $(TEXT_1) $(TEXT_1_BIN)

$(TEXT_2_BIN): $(TEXT_2)
	$(TEXT_CONVERTER) $(TEXT_2) $(TEXT_2_BIN)

$(TEXT_3_BIN): $(TEXT_3)
	$(TEXT_CONVERTER) $(TEXT_3) $(TEXT_3_BIN)

$(SYMBOLS_PATTERN) $(SYMBOLS_PALETTE): $(SYMBOLS_IMAGE)
	$(TILER) -i0 $(SYMBOLS_IMAGE) --enable-palettes 0	--out-pattern-table0 $(SYMBOLS_PATTERN) --out-palette0 $(SYMBOLS_PALETTE)

.PHONY: clean
