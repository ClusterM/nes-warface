STORY?=1

TITLE_IMAGE=images/warface_logo.gif
PAGODA=images/pagoda.gif
MYATEJ=images/myatej2.gif
GLAZA=images/glaza.gif
RAYON4=images/rayon4_2.gif
SPUTNIK=images/sputnik.gif
SINDIKAT=images/sindikat.gif
BUHANKA=images/buhanka.gif
CHERNOBYL=images/chernobyl.gif
SWORM=images/sworm_bw2.gif
GORGONA=images/gorgona.gif
DIRA=images/dira.gif
SHKOLA=images/shkola.gif
ZAPRAVKA=images/zapravka.gif
TRAILER_PARK=images/trailer-park2.gif
BELAYA_AKULA=images/belaya_akula.gif
CREDITS_IMAGE=images/credits_date.png

ifeq ($(STORY),1)
	FRAME_0_IMAGE=$(PAGODA)
	FRAME_1_IMAGE=$(MYATEJ)
	FRAME_2_IMAGE=$(GLAZA)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/0_0.txt
	TEXT_1=text/0_1.txt
	TEXT_2=text/0_2.txt
	TEXT_3=text/0_3.txt
endif
ifeq ($(STORY),2)
	FRAME_0_IMAGE=$(RAYON4)
	FRAME_1_IMAGE=$(SPUTNIK)
	FRAME_2_IMAGE=$(SINDIKAT)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/1_0.txt
	TEXT_1=text/1_1.txt
	TEXT_2=text/1_2.txt
	TEXT_3=text/1_3.txt
endif
ifeq ($(STORY),3)
	FRAME_0_IMAGE=$(BUHANKA)
	FRAME_1_IMAGE=$(CHERNOBYL)
	FRAME_2_IMAGE=$(SWORM)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/2_0.txt
	TEXT_1=text/2_1.txt
	TEXT_2=text/2_2.txt
	TEXT_3=text/2_3.txt
endif
ifeq ($(STORY),4)
	FRAME_0_IMAGE=$(GORGONA)
	FRAME_1_IMAGE=$(DIRA)
	FRAME_2_IMAGE=$(SWORM)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/3_0.txt
	TEXT_1=text/3_1.txt
	TEXT_2=text/3_2.txt
	TEXT_3=text/3_3.txt
endif
ifeq ($(STORY),5)
	FRAME_0_IMAGE=$(SHKOLA)
	FRAME_1_IMAGE=$(ZAPRAVKA)
	FRAME_2_IMAGE=$(SPUTNIK)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/4_0.txt
	TEXT_1=text/4_1.txt
	TEXT_2=text/4_2.txt
	TEXT_3=text/4_3.txt
endif
ifeq ($(STORY),6)
	FRAME_0_IMAGE=$(TRAILER_PARK)
	FRAME_1_IMAGE=$(BELAYA_AKULA)
	FRAME_2_IMAGE=$(SWORM)
	FRAME_3_IMAGE=$(TITLE_IMAGE)
	TEXT_0=text/5_0.txt
	TEXT_1=text/5_1.txt
	TEXT_2=text/5_2.txt
	TEXT_3=text/5_3.txt
endif
ifeq ($(STORY),7)
	FRAME_0_IMAGE=$(MYATEJ)
	FRAME_1_IMAGE=$(TRAILER_PARK)
	FRAME_2_IMAGE=$(ZAPRAVKA)
	FRAME_3_IMAGE=$(SWORM)
	TEXT_0=text/6_0.txt
	TEXT_1=text/6_1.txt
	TEXT_2=text/6_2.txt
	TEXT_3=text/6_3.txt
endif

LOGO_IMAGE=images/warface_logo_small.gif
SYMBOLS_IMAGE=images/symbols.png

NESASM=tools/nesasm
EMU=fceux64
SPLITTER=tools/ImageSplitter
TILER=tools/NesTiler
TEXT_CONVERTER=tools/TextConverter
SOURCE=warface.asm
EXECUTABLE=warface_$(STORY).nes
MUSIC=Warface-12.nsf
MUSIC_BIN=music.bin
MUSIC_ASM=music.asm
INCLUDES=main.asm clean.asm dimming.asm text.asm nametables.asm patterns.asm buttons.asm sprites.asm $(MUSIC_ASM)

TITLE_PATTERN_0_BIN=title_pattern_0.bin
TITLE_PATTERN_1_BIN=title_pattern_1.bin
TITLE_PATTERN_2_BIN=title_pattern_2.bin
TITLE_PATTERN_3_BIN=title_pattern_3.bin
TITLE_NAME_TABLE_0_BIN=title_name_table_0.bin
TITLE_NAME_TABLE_1_BIN=title_name_table_1.bin
TITLE_NAME_TABLE_2_BIN=title_name_table_2.bin
TITLE_NAME_TABLE_3_BIN=title_name_table_3.bin
TITLE_ATTR_TABLE_0_BIN=title_attr_table_0.bin
TITLE_ATTR_TABLE_1_BIN=title_attr_table_1.bin
TITLE_ATTR_TABLE_2_BIN=title_attr_table_2.bin
TITLE_ATTR_TABLE_3_BIN=title_attr_table_3.bin
TITLE_PALETTE_0_BIN=title_palette_0.bin
TITLE_PALETTE_1_BIN=title_palette_1.bin
TITLE_PALETTE_2_BIN=title_palette_2.bin
TITLE_PALETTE_3_BIN=title_palette_3.bin

FRAME_0_PATTERN_0_BIN=$(notdir $(FRAME_0_IMAGE))_pattern_0.bin
FRAME_0_PATTERN_1_BIN=$(notdir $(FRAME_0_IMAGE))_pattern_1.bin
FRAME_0_PATTERN_2_BIN=$(notdir $(FRAME_0_IMAGE))_pattern_2.bin
FRAME_0_PATTERN_3_BIN=$(notdir $(FRAME_0_IMAGE))_pattern_3.bin
FRAME_0_NAME_TABLE_0_BIN=$(notdir $(FRAME_0_IMAGE))_name_table_0.bin
FRAME_0_NAME_TABLE_1_BIN=$(notdir $(FRAME_0_IMAGE))_name_table_1.bin
FRAME_0_NAME_TABLE_2_BIN=$(notdir $(FRAME_0_IMAGE))_name_table_2.bin
FRAME_0_NAME_TABLE_3_BIN=$(notdir $(FRAME_0_IMAGE))_name_table_3.bin
FRAME_0_ATTR_TABLE_0_BIN=$(notdir $(FRAME_0_IMAGE))_attr_table_0.bin
FRAME_0_ATTR_TABLE_1_BIN=$(notdir $(FRAME_0_IMAGE))_attr_table_1.bin
FRAME_0_ATTR_TABLE_2_BIN=$(notdir $(FRAME_0_IMAGE))_attr_table_2.bin
FRAME_0_ATTR_TABLE_3_BIN=$(notdir $(FRAME_0_IMAGE))_attr_table_3.bin
FRAME_0_PALETTE_0_BIN=$(notdir $(FRAME_0_IMAGE))_palette_0.bin
FRAME_0_PALETTE_1_BIN=$(notdir $(FRAME_0_IMAGE))_palette_1.bin
FRAME_0_PALETTE_2_BIN=$(notdir $(FRAME_0_IMAGE))_palette_2.bin
FRAME_0_PALETTE_3_BIN=$(notdir $(FRAME_0_IMAGE))_palette_3.bin

FRAME_1_PATTERN_0_BIN=$(notdir $(FRAME_1_IMAGE))_pattern_0.bin
FRAME_1_PATTERN_1_BIN=$(notdir $(FRAME_1_IMAGE))_pattern_1.bin
FRAME_1_PATTERN_2_BIN=$(notdir $(FRAME_1_IMAGE))_pattern_2.bin
FRAME_1_PATTERN_3_BIN=$(notdir $(FRAME_1_IMAGE))_pattern_3.bin
FRAME_1_NAME_TABLE_0_BIN=$(notdir $(FRAME_1_IMAGE))_name_table_0.bin
FRAME_1_NAME_TABLE_1_BIN=$(notdir $(FRAME_1_IMAGE))_name_table_1.bin
FRAME_1_NAME_TABLE_2_BIN=$(notdir $(FRAME_1_IMAGE))_name_table_2.bin
FRAME_1_NAME_TABLE_3_BIN=$(notdir $(FRAME_1_IMAGE))_name_table_3.bin
FRAME_1_ATTR_TABLE_0_BIN=$(notdir $(FRAME_1_IMAGE))_attr_table_0.bin
FRAME_1_ATTR_TABLE_1_BIN=$(notdir $(FRAME_1_IMAGE))_attr_table_1.bin
FRAME_1_ATTR_TABLE_2_BIN=$(notdir $(FRAME_1_IMAGE))_attr_table_2.bin
FRAME_1_ATTR_TABLE_3_BIN=$(notdir $(FRAME_1_IMAGE))_attr_table_3.bin
FRAME_1_PALETTE_0_BIN=$(notdir $(FRAME_1_IMAGE))_palette_0.bin
FRAME_1_PALETTE_1_BIN=$(notdir $(FRAME_1_IMAGE))_palette_1.bin
FRAME_1_PALETTE_2_BIN=$(notdir $(FRAME_1_IMAGE))_palette_2.bin
FRAME_1_PALETTE_3_BIN=$(notdir $(FRAME_1_IMAGE))_palette_3.bin

FRAME_2_PATTERN_0_BIN=$(notdir $(FRAME_2_IMAGE))_pattern_0.bin
FRAME_2_PATTERN_1_BIN=$(notdir $(FRAME_2_IMAGE))_pattern_1.bin
FRAME_2_PATTERN_2_BIN=$(notdir $(FRAME_2_IMAGE))_pattern_2.bin
FRAME_2_PATTERN_3_BIN=$(notdir $(FRAME_2_IMAGE))_pattern_3.bin
FRAME_2_NAME_TABLE_0_BIN=$(notdir $(FRAME_2_IMAGE))_name_table_0.bin
FRAME_2_NAME_TABLE_1_BIN=$(notdir $(FRAME_2_IMAGE))_name_table_1.bin
FRAME_2_NAME_TABLE_2_BIN=$(notdir $(FRAME_2_IMAGE))_name_table_2.bin
FRAME_2_NAME_TABLE_3_BIN=$(notdir $(FRAME_2_IMAGE))_name_table_3.bin
FRAME_2_ATTR_TABLE_0_BIN=$(notdir $(FRAME_2_IMAGE))_attr_table_0.bin
FRAME_2_ATTR_TABLE_1_BIN=$(notdir $(FRAME_2_IMAGE))_attr_table_1.bin
FRAME_2_ATTR_TABLE_2_BIN=$(notdir $(FRAME_2_IMAGE))_attr_table_2.bin
FRAME_2_ATTR_TABLE_3_BIN=$(notdir $(FRAME_2_IMAGE))_attr_table_3.bin
FRAME_2_PALETTE_0_BIN=$(notdir $(FRAME_2_IMAGE))_palette_0.bin
FRAME_2_PALETTE_1_BIN=$(notdir $(FRAME_2_IMAGE))_palette_1.bin
FRAME_2_PALETTE_2_BIN=$(notdir $(FRAME_2_IMAGE))_palette_2.bin
FRAME_2_PALETTE_3_BIN=$(notdir $(FRAME_2_IMAGE))_palette_3.bin

FRAME_3_PATTERN_0_BIN=$(notdir $(FRAME_3_IMAGE))_pattern_0.bin
FRAME_3_PATTERN_1_BIN=$(notdir $(FRAME_3_IMAGE))_pattern_1.bin
FRAME_3_PATTERN_2_BIN=$(notdir $(FRAME_3_IMAGE))_pattern_2.bin
FRAME_3_PATTERN_3_BIN=$(notdir $(FRAME_3_IMAGE))_pattern_3.bin
FRAME_3_NAME_TABLE_0_BIN=$(notdir $(FRAME_3_IMAGE))_name_table_0.bin
FRAME_3_NAME_TABLE_1_BIN=$(notdir $(FRAME_3_IMAGE))_name_table_1.bin
FRAME_3_NAME_TABLE_2_BIN=$(notdir $(FRAME_3_IMAGE))_name_table_2.bin
FRAME_3_NAME_TABLE_3_BIN=$(notdir $(FRAME_3_IMAGE))_name_table_3.bin
FRAME_3_ATTR_TABLE_0_BIN=$(notdir $(FRAME_3_IMAGE))_attr_table_0.bin
FRAME_3_ATTR_TABLE_1_BIN=$(notdir $(FRAME_3_IMAGE))_attr_table_1.bin
FRAME_3_ATTR_TABLE_2_BIN=$(notdir $(FRAME_3_IMAGE))_attr_table_2.bin
FRAME_3_ATTR_TABLE_3_BIN=$(notdir $(FRAME_3_IMAGE))_attr_table_3.bin
FRAME_3_PALETTE_0_BIN=$(notdir $(FRAME_3_IMAGE))_palette_0.bin
FRAME_3_PALETTE_1_BIN=$(notdir $(FRAME_3_IMAGE))_palette_1.bin
FRAME_3_PALETTE_2_BIN=$(notdir $(FRAME_3_IMAGE))_palette_2.bin
FRAME_3_PALETTE_3_BIN=$(notdir $(FRAME_3_IMAGE))_palette_3.bin

CREDITS_PATTERN_0_BIN=credits_pattern_0.bin
CREDITS_PATTERN_1_BIN=credits_pattern_1.bin
CREDITS_PATTERN_2_BIN=credits_pattern_2.bin
CREDITS_PATTERN_3_BIN=credits_pattern_3.bin
CREDITS_NAME_TABLE_0_BIN=credits_name_table_0.bin
CREDITS_NAME_TABLE_1_BIN=credits_name_table_1.bin
CREDITS_NAME_TABLE_2_BIN=credits_name_table_2.bin
CREDITS_NAME_TABLE_3_BIN=credits_name_table_3.bin
CREDITS_ATTR_TABLE_0_BIN=credits_attr_table_0.bin
CREDITS_ATTR_TABLE_1_BIN=credits_attr_table_1.bin
CREDITS_ATTR_TABLE_2_BIN=credits_attr_table_2.bin
CREDITS_ATTR_TABLE_3_BIN=credits_attr_table_3.bin
CREDITS_PALETTE_0_BIN=credits_palette_0.bin
CREDITS_PALETTE_1_BIN=credits_palette_1.bin
CREDITS_PALETTE_2_BIN=credits_palette_2.bin
CREDITS_PALETTE_3_BIN=credits_palette_3.bin

TEXT_0_BIN=text_$(notdir $(TEXT_0)).bin
TEXT_1_BIN=text_$(notdir $(TEXT_1)).bin
TEXT_2_BIN=text_$(notdir $(TEXT_2)).bin
TEXT_3_BIN=text_$(notdir $(TEXT_3)).bin

WARFACE_LOGO_PATTERN_BIN=warface_logo_pattern.bin
WARFACE_LOGO_PALETTE_BIN=warface_logo_palette.bin

SYMBOLS_PATTERN_BIN=symbols_pattern.bin
SYMBOLS_PALETTE_BIN=symbols_palette.bin

all:
	$(MAKE) rom STORY=1
	$(MAKE) rom STORY=2
	$(MAKE) rom STORY=3
	$(MAKE) rom STORY=4
	$(MAKE) rom STORY=5
	$(MAKE) rom STORY=6
	$(MAKE) rom STORY=7

rom: $(EXECUTABLE)

nes: $(EXECUTABLE)

run: $(EXECUTABLE)
	$(EMU) $(EXECUTABLE)

$(EXECUTABLE): $(SOURCE) $(INCLUDES) $(MUSIC_BIN) \
$(TITLE_PATTERN_0_BIN) $(TITLE_PATTERN_1_BIN) $(TITLE_PATTERN_2_BIN) $(TITLE_PATTERN_3_BIN) \
$(TITLE_NAME_TABLE_0_BIN) $(TITLE_NAME_TABLE_1_BIN) $(TITLE_NAME_TABLE_2_BIN) $(TITLE_NAME_TABLE_3_BIN) \
$(TITLE_ATTR_TABLE_0_BIN) $(TITLE_ATTR_TABLE_1_BIN) $(TITLE_ATTR_TABLE_2_BIN) $(TITLE_ATTR_TABLE_3_BIN) \
$(TITLE_PALETTE_0_BIN) $(TITLE_PALETTE_1_BIN) $(TITLE_PALETTE_2_BIN) $(TITLE_PALETTE_3_BIN) \
$(FRAME_0_PATTERN_0_BIN) $(FRAME_0_PATTERN_1_BIN) $(FRAME_0_PATTERN_2_BIN) $(FRAME_0_PATTERN_3_BIN) \
$(FRAME_0_NAME_TABLE_0_BIN) $(FRAME_0_NAME_TABLE_1_BIN) $(FRAME_0_NAME_TABLE_2_BIN) $(FRAME_0_NAME_TABLE_3_BIN) \
$(FRAME_0_ATTR_TABLE_0_BIN) $(FRAME_0_ATTR_TABLE_1_BIN) $(FRAME_0_ATTR_TABLE_2_BIN) $(FRAME_0_ATTR_TABLE_3_BIN) \
$(FRAME_0_PALETTE_0_BIN) $(FRAME_0_PALETTE_1_BIN) $(FRAME_0_PALETTE_2_BIN) $(FRAME_0_PALETTE_3_BIN) \
$(FRAME_1_PATTERN_0_BIN) $(FRAME_1_PATTERN_1_BIN) $(FRAME_1_PATTERN_2_BIN) $(FRAME_1_PATTERN_3_BIN) \
$(FRAME_1_NAME_TABLE_0_BIN) $(FRAME_1_NAME_TABLE_1_BIN) $(FRAME_1_NAME_TABLE_2_BIN) $(FRAME_1_NAME_TABLE_3_BIN) \
$(FRAME_1_ATTR_TABLE_0_BIN) $(FRAME_1_ATTR_TABLE_1_BIN) $(FRAME_1_ATTR_TABLE_2_BIN) $(FRAME_1_ATTR_TABLE_3_BIN) \
$(FRAME_1_PALETTE_0_BIN) $(FRAME_1_PALETTE_1_BIN) $(FRAME_1_PALETTE_2_BIN) $(FRAME_1_PALETTE_3_BIN) \
$(FRAME_2_PATTERN_0_BIN) $(FRAME_2_PATTERN_1_BIN) $(FRAME_2_PATTERN_2_BIN) $(FRAME_2_PATTERN_3_BIN) \
$(FRAME_2_NAME_TABLE_0_BIN) $(FRAME_2_NAME_TABLE_1_BIN) $(FRAME_2_NAME_TABLE_2_BIN) $(FRAME_2_NAME_TABLE_3_BIN) \
$(FRAME_2_ATTR_TABLE_0_BIN) $(FRAME_2_ATTR_TABLE_1_BIN) $(FRAME_2_ATTR_TABLE_2_BIN) $(FRAME_2_ATTR_TABLE_3_BIN) \
$(FRAME_2_PALETTE_0_BIN) $(FRAME_2_PALETTE_1_BIN) $(FRAME_2_PALETTE_2_BIN) $(FRAME_2_PALETTE_3_BIN) \
$(FRAME_3_PATTERN_0_BIN) $(FRAME_3_PATTERN_1_BIN) $(FRAME_3_PATTERN_2_BIN) $(FRAME_3_PATTERN_3_BIN) \
$(FRAME_3_NAME_TABLE_0_BIN) $(FRAME_3_NAME_TABLE_1_BIN) $(FRAME_3_NAME_TABLE_2_BIN) $(FRAME_3_NAME_TABLE_3_BIN) \
$(FRAME_3_ATTR_TABLE_0_BIN) $(FRAME_3_ATTR_TABLE_1_BIN) $(FRAME_3_ATTR_TABLE_2_BIN) $(FRAME_3_ATTR_TABLE_3_BIN) \
$(FRAME_3_PALETTE_0_BIN) $(FRAME_3_PALETTE_1_BIN) $(FRAME_3_PALETTE_2_BIN) $(FRAME_3_PALETTE_3_BIN) \
$(CREDITS_PATTERN_0_BIN) $(CREDITS_PATTERN_1_BIN) $(CREDITS_PATTERN_2_BIN) $(CREDITS_PATTERN_3_BIN) \
$(CREDITS_NAME_TABLE_0_BIN) $(CREDITS_NAME_TABLE_1_BIN) $(CREDITS_NAME_TABLE_2_BIN) $(CREDITS_NAME_TABLE_3_BIN) \
$(CREDITS_ATTR_TABLE_0_BIN) $(CREDITS_ATTR_TABLE_1_BIN) $(CREDITS_ATTR_TABLE_2_BIN) $(CREDITS_ATTR_TABLE_3_BIN) \
$(CREDITS_PALETTE_0_BIN) $(CREDITS_PALETTE_1_BIN) $(CREDITS_PALETTE_2_BIN) $(CREDITS_PALETTE_3_BIN) \
$(WARFACE_LOGO_PATTERN_BIN) $(WARFACE_LOGO_PALETTE_BIN) \
$(TEXT_0_BIN) $(TEXT_1_BIN) $(TEXT_2_BIN) $(TEXT_3_BIN) $(SYMBOLS_PATTERN_BIN) $(SYMBOLS_PALETTE_BIN)
	rm -f $(EXECUTABLE)
	$(NESASM) $(SOURCE) -o $(EXECUTABLE) --symbols=$(notdir $(EXECUTABLE)) -iWss \
	-C title_pattern_0_bin=$(TITLE_PATTERN_0_BIN) -C title_pattern_1_bin=$(TITLE_PATTERN_1_BIN) \
	-C title_pattern_2_bin=$(TITLE_PATTERN_2_BIN) -C title_pattern_3_bin=$(TITLE_PATTERN_3_BIN) \
	-C title_name_table_0_bin=$(TITLE_NAME_TABLE_0_BIN) -C title_name_table_1_bin=$(TITLE_NAME_TABLE_1_BIN) \
	-C title_name_table_2_bin=$(TITLE_NAME_TABLE_2_BIN) -C title_name_table_3_bin=$(TITLE_NAME_TABLE_3_BIN) \
	-C title_attr_table_0_bin=$(TITLE_ATTR_TABLE_0_BIN) -C title_attr_table_1_bin=$(TITLE_ATTR_TABLE_1_BIN) \
	-C title_attr_table_2_bin=$(TITLE_ATTR_TABLE_2_BIN) -C title_attr_table_3_bin=$(TITLE_ATTR_TABLE_3_BIN) \
	-C title_palette_0_bin=$(TITLE_PALETTE_0_BIN) -C title_palette_1_bin=$(TITLE_PALETTE_1_BIN) \
	-C title_palette_2_bin=$(TITLE_PALETTE_2_BIN) -C title_palette_3_bin=$(TITLE_PALETTE_3_BIN) \
	-C frame_0_pattern_0_bin=$(FRAME_0_PATTERN_0_BIN) -C frame_0_pattern_1_bin=$(FRAME_0_PATTERN_1_BIN) \
	-C frame_0_pattern_2_bin=$(FRAME_0_PATTERN_2_BIN) -C frame_0_pattern_3_bin=$(FRAME_0_PATTERN_3_BIN) \
	-C frame_0_name_table_0_bin=$(FRAME_0_NAME_TABLE_0_BIN) -C frame_0_name_table_1_bin=$(FRAME_0_NAME_TABLE_1_BIN) \
	-C frame_0_name_table_2_bin=$(FRAME_0_NAME_TABLE_2_BIN) -C frame_0_name_table_3_bin=$(FRAME_0_NAME_TABLE_3_BIN) \
	-C frame_0_attr_table_0_bin=$(FRAME_0_ATTR_TABLE_0_BIN) -C frame_0_attr_table_1_bin=$(FRAME_0_ATTR_TABLE_1_BIN) \
	-C frame_0_attr_table_2_bin=$(FRAME_0_ATTR_TABLE_2_BIN) -C frame_0_attr_table_3_bin=$(FRAME_0_ATTR_TABLE_3_BIN) \
	-C frame_0_palette_0_bin=$(FRAME_0_PALETTE_0_BIN) -C frame_0_palette_1_bin=$(FRAME_0_PALETTE_1_BIN) \
	-C frame_0_palette_2_bin=$(FRAME_0_PALETTE_2_BIN) -C frame_0_palette_3_bin=$(FRAME_0_PALETTE_3_BIN) \
	-C frame_1_pattern_0_bin=$(FRAME_1_PATTERN_0_BIN) -C frame_1_pattern_1_bin=$(FRAME_1_PATTERN_1_BIN) \
	-C frame_1_pattern_2_bin=$(FRAME_1_PATTERN_2_BIN) -C frame_1_pattern_3_bin=$(FRAME_1_PATTERN_3_BIN) \
	-C frame_1_name_table_0_bin=$(FRAME_1_NAME_TABLE_0_BIN) -C frame_1_name_table_1_bin=$(FRAME_1_NAME_TABLE_1_BIN) \
	-C frame_1_name_table_2_bin=$(FRAME_1_NAME_TABLE_2_BIN) -C frame_1_name_table_3_bin=$(FRAME_1_NAME_TABLE_3_BIN) \
	-C frame_1_attr_table_0_bin=$(FRAME_1_ATTR_TABLE_0_BIN) -C frame_1_attr_table_1_bin=$(FRAME_1_ATTR_TABLE_1_BIN) \
	-C frame_1_attr_table_2_bin=$(FRAME_1_ATTR_TABLE_2_BIN) -C frame_1_attr_table_3_bin=$(FRAME_1_ATTR_TABLE_3_BIN) \
	-C frame_1_palette_0_bin=$(FRAME_1_PALETTE_0_BIN) -C frame_1_palette_1_bin=$(FRAME_1_PALETTE_1_BIN) \
	-C frame_1_palette_2_bin=$(FRAME_1_PALETTE_2_BIN) -C frame_1_palette_3_bin=$(FRAME_1_PALETTE_3_BIN) \
	-C frame_2_pattern_0_bin=$(FRAME_2_PATTERN_0_BIN) -C frame_2_pattern_1_bin=$(FRAME_2_PATTERN_1_BIN) \
	-C frame_2_pattern_2_bin=$(FRAME_2_PATTERN_2_BIN) -C frame_2_pattern_3_bin=$(FRAME_2_PATTERN_3_BIN) \
	-C frame_2_name_table_0_bin=$(FRAME_2_NAME_TABLE_0_BIN) -C frame_2_name_table_1_bin=$(FRAME_2_NAME_TABLE_1_BIN) \
	-C frame_2_name_table_2_bin=$(FRAME_2_NAME_TABLE_2_BIN) -C frame_2_name_table_3_bin=$(FRAME_2_NAME_TABLE_3_BIN) \
	-C frame_2_attr_table_0_bin=$(FRAME_2_ATTR_TABLE_0_BIN) -C frame_2_attr_table_1_bin=$(FRAME_2_ATTR_TABLE_1_BIN) \
	-C frame_2_attr_table_2_bin=$(FRAME_2_ATTR_TABLE_2_BIN) -C frame_2_attr_table_3_bin=$(FRAME_2_ATTR_TABLE_3_BIN) \
	-C frame_2_palette_0_bin=$(FRAME_2_PALETTE_0_BIN) -C frame_2_palette_1_bin=$(FRAME_2_PALETTE_1_BIN) \
	-C frame_2_palette_2_bin=$(FRAME_2_PALETTE_2_BIN) -C frame_2_palette_3_bin=$(FRAME_2_PALETTE_3_BIN) \
	-C frame_3_pattern_0_bin=$(FRAME_3_PATTERN_0_BIN) -C frame_3_pattern_1_bin=$(FRAME_3_PATTERN_1_BIN) \
	-C frame_3_pattern_2_bin=$(FRAME_3_PATTERN_2_BIN) -C frame_3_pattern_3_bin=$(FRAME_3_PATTERN_3_BIN) \
	-C frame_3_name_table_0_bin=$(FRAME_3_NAME_TABLE_0_BIN) -C frame_3_name_table_1_bin=$(FRAME_3_NAME_TABLE_1_BIN) \
	-C frame_3_name_table_2_bin=$(FRAME_3_NAME_TABLE_2_BIN) -C frame_3_name_table_3_bin=$(FRAME_3_NAME_TABLE_3_BIN) \
	-C frame_3_attr_table_0_bin=$(FRAME_3_ATTR_TABLE_0_BIN) -C frame_3_attr_table_1_bin=$(FRAME_3_ATTR_TABLE_1_BIN) \
	-C frame_3_attr_table_2_bin=$(FRAME_3_ATTR_TABLE_2_BIN) -C frame_3_attr_table_3_bin=$(FRAME_3_ATTR_TABLE_3_BIN) \
	-C frame_3_palette_0_bin=$(FRAME_3_PALETTE_0_BIN) -C frame_3_palette_1_bin=$(FRAME_3_PALETTE_1_BIN) \
	-C frame_3_palette_2_bin=$(FRAME_3_PALETTE_2_BIN) -C frame_3_palette_3_bin=$(FRAME_3_PALETTE_3_BIN) \
	-C credits_pattern_0_bin=$(CREDITS_PATTERN_0_BIN) -C credits_pattern_1_bin=$(CREDITS_PATTERN_1_BIN) \
	-C credits_pattern_2_bin=$(CREDITS_PATTERN_2_BIN) -C credits_pattern_3_bin=$(CREDITS_PATTERN_3_BIN) \
	-C credits_name_table_0_bin=$(CREDITS_NAME_TABLE_0_BIN) -C credits_name_table_1_bin=$(CREDITS_NAME_TABLE_1_BIN) \
	-C credits_name_table_2_bin=$(CREDITS_NAME_TABLE_2_BIN) -C credits_name_table_3_bin=$(CREDITS_NAME_TABLE_3_BIN) \
	-C credits_attr_table_0_bin=$(CREDITS_ATTR_TABLE_0_BIN) -C credits_attr_table_1_bin=$(CREDITS_ATTR_TABLE_1_BIN) \
	-C credits_attr_table_2_bin=$(CREDITS_ATTR_TABLE_2_BIN) -C credits_attr_table_3_bin=$(CREDITS_ATTR_TABLE_3_BIN) \
	-C credits_palette_0_bin=$(CREDITS_PALETTE_0_BIN) -C credits_palette_1_bin=$(CREDITS_PALETTE_1_BIN) \
	-C credits_palette_2_bin=$(CREDITS_PALETTE_2_BIN) -C credits_palette_3_bin=$(CREDITS_PALETTE_3_BIN) \
	-C warface_logo_pattern_bin=$(WARFACE_LOGO_PATTERN_BIN) -C warface_logo_palette_bin=$(WARFACE_LOGO_PALETTE_BIN) \
	-C text_0_bin=$(TEXT_0_BIN) -C text_1_bin=$(TEXT_1_BIN) \
	-C text_2_bin=$(TEXT_2_BIN) -C text_3_bin=$(TEXT_3_BIN) \
	-C symbols_pattern_bin=$(SYMBOLS_PATTERN_BIN) -C symbols_palette_bin=$(SYMBOLS_PALETTE_BIN) \
	-C music_bin=$(MUSIC_BIN) -C music_asm=$(MUSIC_ASM)

build: $(EXECUTABLE)

clean:
	rm -f *.nes *.lst *.nl *.png *.bin $(MUSIC_ASM)

$(TITLE_PATTERN_0_BIN) $(TITLE_PATTERN_1_BIN) $(TITLE_PATTERN_2_BIN) $(TITLE_PATTERN_3_BIN) \
$(TITLE_NAME_TABLE_0_BIN) $(TITLE_NAME_TABLE_1_BIN) $(TITLE_NAME_TABLE_2_BIN) $(TITLE_NAME_TABLE_3_BIN) \
$(TITLE_ATTR_TABLE_0_BIN) $(TITLE_ATTR_TABLE_1_BIN) $(TITLE_ATTR_TABLE_2_BIN) $(TITLE_ATTR_TABLE_3_BIN) \
$(TITLE_PALETTE_0_BIN) $(TITLE_PALETTE_1_BIN) $(TITLE_PALETTE_2_BIN) $(TITLE_PALETTE_3_BIN): $(TITLE_IMAGE)
	$(TILER) -i0 $(TITLE_IMAGE):0:64 -i1 $(TITLE_IMAGE):64:64 -i2 $(TITLE_IMAGE):128:64 -i3 $(TITLE_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(TITLE_PATTERN_0_BIN) --out-pattern-table1 $(TITLE_PATTERN_1_BIN) --out-pattern-table2 $(TITLE_PATTERN_2_BIN) --out-pattern-table3 $(TITLE_PATTERN_3_BIN) \
	--out-name-table0 $(TITLE_NAME_TABLE_0_BIN) --out-name-table1 $(TITLE_NAME_TABLE_1_BIN) --out-name-table2 $(TITLE_NAME_TABLE_2_BIN) --out-name-table3 $(TITLE_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(TITLE_ATTR_TABLE_0_BIN) --out-attribute-table1 $(TITLE_ATTR_TABLE_1_BIN) --out-attribute-table2 $(TITLE_ATTR_TABLE_2_BIN) --out-attribute-table3 $(TITLE_ATTR_TABLE_3_BIN) \
	--out-palette0 $(TITLE_PALETTE_0_BIN) --out-palette1 $(TITLE_PALETTE_1_BIN) --out-palette2 $(TITLE_PALETTE_2_BIN) --out-palette3 $(TITLE_PALETTE_3_BIN)

$(FRAME_0_PATTERN_0_BIN) $(FRAME_0_PATTERN_1_BIN) $(FRAME_0_PATTERN_2_BIN) $(FRAME_0_PATTERN_3_BIN) \
$(FRAME_0_NAME_TABLE_0_BIN) $(FRAME_0_NAME_TABLE_1_BIN) $(FRAME_0_NAME_TABLE_2_BIN) $(FRAME_0_NAME_TABLE_3_BIN) \
$(FRAME_0_ATTR_TABLE_0_BIN) $(FRAME_0_ATTR_TABLE_1_BIN) $(FRAME_0_ATTR_TABLE_2_BIN) $(FRAME_0_ATTR_TABLE_3_BIN) \
$(FRAME_0_PALETTE_0_BIN) $(FRAME_0_PALETTE_1_BIN) $(FRAME_0_PALETTE_2_BIN) $(FRAME_0_PALETTE_3_BIN): $(FRAME_0_IMAGE)
	$(TILER) -i0 $(FRAME_0_IMAGE):0:64 -i1 $(FRAME_0_IMAGE):64:64 -i2 $(FRAME_0_IMAGE):128:64 -i3 $(FRAME_0_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_0_PATTERN_0_BIN) --out-pattern-table1 $(FRAME_0_PATTERN_1_BIN) --out-pattern-table2 $(FRAME_0_PATTERN_2_BIN) --out-pattern-table3 $(FRAME_0_PATTERN_3_BIN) \
	--out-name-table0 $(FRAME_0_NAME_TABLE_0_BIN) --out-name-table1 $(FRAME_0_NAME_TABLE_1_BIN) --out-name-table2 $(FRAME_0_NAME_TABLE_2_BIN) --out-name-table3 $(FRAME_0_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(FRAME_0_ATTR_TABLE_0_BIN) --out-attribute-table1 $(FRAME_0_ATTR_TABLE_1_BIN) --out-attribute-table2 $(FRAME_0_ATTR_TABLE_2_BIN) --out-attribute-table3 $(FRAME_0_ATTR_TABLE_3_BIN) \
	--out-palette0 $(FRAME_0_PALETTE_0_BIN) --out-palette1 $(FRAME_0_PALETTE_1_BIN) --out-palette2 $(FRAME_0_PALETTE_2_BIN) --out-palette3 $(FRAME_0_PALETTE_3_BIN)

$(FRAME_1_PATTERN_0_BIN) $(FRAME_1_PATTERN_1_BIN) $(FRAME_1_PATTERN_2_BIN) $(FRAME_1_PATTERN_3_BIN) \
$(FRAME_1_NAME_TABLE_0_BIN) $(FRAME_1_NAME_TABLE_1_BIN) $(FRAME_1_NAME_TABLE_2_BIN) $(FRAME_1_NAME_TABLE_3_BIN) \
$(FRAME_1_ATTR_TABLE_0_BIN) $(FRAME_1_ATTR_TABLE_1_BIN) $(FRAME_1_ATTR_TABLE_2_BIN) $(FRAME_1_ATTR_TABLE_3_BIN) \
$(FRAME_1_PALETTE_0_BIN) $(FRAME_1_PALETTE_1_BIN) $(FRAME_1_PALETTE_2_BIN) $(FRAME_1_PALETTE_3_BIN): $(FRAME_1_IMAGE)
	$(TILER) -i0 $(FRAME_1_IMAGE):0:64 -i1 $(FRAME_1_IMAGE):64:64 -i2 $(FRAME_1_IMAGE):128:64 -i3 $(FRAME_1_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_1_PATTERN_0_BIN) --out-pattern-table1 $(FRAME_1_PATTERN_1_BIN) --out-pattern-table2 $(FRAME_1_PATTERN_2_BIN) --out-pattern-table3 $(FRAME_1_PATTERN_3_BIN) \
	--out-name-table0 $(FRAME_1_NAME_TABLE_0_BIN) --out-name-table1 $(FRAME_1_NAME_TABLE_1_BIN) --out-name-table2 $(FRAME_1_NAME_TABLE_2_BIN) --out-name-table3 $(FRAME_1_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(FRAME_1_ATTR_TABLE_0_BIN) --out-attribute-table1 $(FRAME_1_ATTR_TABLE_1_BIN) --out-attribute-table2 $(FRAME_1_ATTR_TABLE_2_BIN) --out-attribute-table3 $(FRAME_1_ATTR_TABLE_3_BIN) \
	--out-palette0 $(FRAME_1_PALETTE_0_BIN) --out-palette1 $(FRAME_1_PALETTE_1_BIN) --out-palette2 $(FRAME_1_PALETTE_2_BIN) --out-palette3 $(FRAME_1_PALETTE_3_BIN)

$(FRAME_2_PATTERN_0_BIN) $(FRAME_2_PATTERN_1_BIN) $(FRAME_2_PATTERN_2_BIN) $(FRAME_2_PATTERN_3_BIN) \
$(FRAME_2_NAME_TABLE_0_BIN) $(FRAME_2_NAME_TABLE_1_BIN) $(FRAME_2_NAME_TABLE_2_BIN) $(FRAME_2_NAME_TABLE_3_BIN) \
$(FRAME_2_ATTR_TABLE_0_BIN) $(FRAME_2_ATTR_TABLE_1_BIN) $(FRAME_2_ATTR_TABLE_2_BIN) $(FRAME_2_ATTR_TABLE_3_BIN) \
$(FRAME_2_PALETTE_0_BIN) $(FRAME_2_PALETTE_1_BIN) $(FRAME_2_PALETTE_2_BIN) $(FRAME_2_PALETTE_3_BIN): $(FRAME_2_IMAGE)
	$(TILER) -i0 $(FRAME_2_IMAGE):0:64 -i1 $(FRAME_2_IMAGE):64:64 -i2 $(FRAME_2_IMAGE):128:64 -i3 $(FRAME_2_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_2_PATTERN_0_BIN) --out-pattern-table1 $(FRAME_2_PATTERN_1_BIN) --out-pattern-table2 $(FRAME_2_PATTERN_2_BIN) --out-pattern-table3 $(FRAME_2_PATTERN_3_BIN) \
	--out-name-table0 $(FRAME_2_NAME_TABLE_0_BIN) --out-name-table1 $(FRAME_2_NAME_TABLE_1_BIN) --out-name-table2 $(FRAME_2_NAME_TABLE_2_BIN) --out-name-table3 $(FRAME_2_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(FRAME_2_ATTR_TABLE_0_BIN) --out-attribute-table1 $(FRAME_2_ATTR_TABLE_1_BIN) --out-attribute-table2 $(FRAME_2_ATTR_TABLE_2_BIN) --out-attribute-table3 $(FRAME_2_ATTR_TABLE_3_BIN) \
	--out-palette0 $(FRAME_2_PALETTE_0_BIN) --out-palette1 $(FRAME_2_PALETTE_1_BIN) --out-palette2 $(FRAME_2_PALETTE_2_BIN) --out-palette3 $(FRAME_2_PALETTE_3_BIN)

$(FRAME_3_PATTERN_0_BIN) $(FRAME_3_PATTERN_1_BIN) $(FRAME_3_PATTERN_2_BIN) $(FRAME_3_PATTERN_3_BIN) \
$(FRAME_3_NAME_TABLE_0_BIN) $(FRAME_3_NAME_TABLE_1_BIN) $(FRAME_3_NAME_TABLE_2_BIN) $(FRAME_3_NAME_TABLE_3_BIN) \
$(FRAME_3_ATTR_TABLE_0_BIN) $(FRAME_3_ATTR_TABLE_1_BIN) $(FRAME_3_ATTR_TABLE_2_BIN) $(FRAME_3_ATTR_TABLE_3_BIN) \
$(FRAME_3_PALETTE_0_BIN) $(FRAME_3_PALETTE_1_BIN) $(FRAME_3_PALETTE_2_BIN) $(FRAME_3_PALETTE_3_BIN): $(FRAME_3_IMAGE)
	$(TILER) -i0 $(FRAME_3_IMAGE):0:64 -i1 $(FRAME_3_IMAGE):64:64 -i2 $(FRAME_3_IMAGE):128:64 -i3 $(FRAME_3_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(FRAME_3_PATTERN_0_BIN) --out-pattern-table1 $(FRAME_3_PATTERN_1_BIN) --out-pattern-table2 $(FRAME_3_PATTERN_2_BIN) --out-pattern-table3 $(FRAME_3_PATTERN_3_BIN) \
	--out-name-table0 $(FRAME_3_NAME_TABLE_0_BIN) --out-name-table1 $(FRAME_3_NAME_TABLE_1_BIN) --out-name-table2 $(FRAME_3_NAME_TABLE_2_BIN) --out-name-table3 $(FRAME_3_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(FRAME_3_ATTR_TABLE_0_BIN) --out-attribute-table1 $(FRAME_3_ATTR_TABLE_1_BIN) --out-attribute-table2 $(FRAME_3_ATTR_TABLE_2_BIN) --out-attribute-table3 $(FRAME_3_ATTR_TABLE_3_BIN) \
	--out-palette0 $(FRAME_3_PALETTE_0_BIN) --out-palette1 $(FRAME_3_PALETTE_1_BIN) --out-palette2 $(FRAME_3_PALETTE_2_BIN) --out-palette3 $(FRAME_3_PALETTE_3_BIN)

$(CREDITS_PATTERN_0_BIN) $(CREDITS_PATTERN_1_BIN) $(CREDITS_PATTERN_2_BIN) $(CREDITS_PATTERN_3_BIN) \
$(CREDITS_NAME_TABLE_0_BIN) $(CREDITS_NAME_TABLE_1_BIN) $(CREDITS_NAME_TABLE_2_BIN) $(CREDITS_NAME_TABLE_3_BIN) \
$(CREDITS_ATTR_TABLE_0_BIN) $(CREDITS_ATTR_TABLE_1_BIN) $(CREDITS_ATTR_TABLE_2_BIN) $(CREDITS_ATTR_TABLE_3_BIN) \
$(CREDITS_PALETTE_0_BIN) $(CREDITS_PALETTE_1_BIN) $(CREDITS_PALETTE_2_BIN) $(CREDITS_PALETTE_3_BIN): $(CREDITS_IMAGE)
	$(TILER) -i0 $(CREDITS_IMAGE):0:64 -i1 $(CREDITS_IMAGE):64:64 -i2 $(CREDITS_IMAGE):128:64 -i3 $(CREDITS_IMAGE):192:48 --enable-palettes 0,1,2,3 \
	--out-pattern-table0 $(CREDITS_PATTERN_0_BIN) --out-pattern-table1 $(CREDITS_PATTERN_1_BIN) --out-pattern-table2 $(CREDITS_PATTERN_2_BIN) --out-pattern-table3 $(CREDITS_PATTERN_3_BIN) \
	--out-name-table0 $(CREDITS_NAME_TABLE_0_BIN) --out-name-table1 $(CREDITS_NAME_TABLE_1_BIN) --out-name-table2 $(CREDITS_NAME_TABLE_2_BIN) --out-name-table3 $(CREDITS_NAME_TABLE_3_BIN) \
	--out-attribute-table0 $(CREDITS_ATTR_TABLE_0_BIN) --out-attribute-table1 $(CREDITS_ATTR_TABLE_1_BIN) --out-attribute-table2 $(CREDITS_ATTR_TABLE_2_BIN) --out-attribute-table3 $(CREDITS_ATTR_TABLE_3_BIN) \
	--out-palette0 $(CREDITS_PALETTE_0_BIN) --out-palette1 $(CREDITS_PALETTE_1_BIN) --out-palette2 $(CREDITS_PALETTE_2_BIN) --out-palette3 $(CREDITS_PALETTE_3_BIN)

$(WARFACE_LOGO_PATTERN_BIN) $(WARFACE_LOGO_PALETTE_BIN): $(LOGO_IMAGE)
	$(TILER) -i0 $(LOGO_IMAGE) --mode sprites --enable-palettes 1 --out-pattern-table0 $(WARFACE_LOGO_PATTERN_BIN) --out-palette1 $(WARFACE_LOGO_PALETTE_BIN)

$(TEXT_0_BIN): $(TEXT_0)
	$(TEXT_CONVERTER) $(TEXT_0) $(TEXT_0_BIN)

$(TEXT_1_BIN): $(TEXT_1)
	$(TEXT_CONVERTER) $(TEXT_1) $(TEXT_1_BIN)

$(TEXT_2_BIN): $(TEXT_2)
	$(TEXT_CONVERTER) $(TEXT_2) $(TEXT_2_BIN)

$(TEXT_3_BIN): $(TEXT_3)
	$(TEXT_CONVERTER) $(TEXT_3) $(TEXT_3_BIN)

$(SYMBOLS_PATTERN_BIN) $(SYMBOLS_PALETTE_BIN): $(SYMBOLS_IMAGE)
	$(TILER) -i0 $(SYMBOLS_IMAGE) --enable-palettes 0	--out-pattern-table0 $(SYMBOLS_PATTERN_BIN) --out-palette0 $(SYMBOLS_PALETTE_BIN) --bgcolor #000000

$(MUSIC_ASM): $(MUSIC)
	printf "NSF_LOAD_ADDR .equ `hexdump $(MUSIC) --skip 8 --length 2 --format '"$$%X"'`\nNSF_INIT_ADDR .equ `hexdump $(MUSIC) --skip 10 --length 2 --format '"$$%X"'`\nNSF_PLAY_ADDR .equ `hexdump $(MUSIC) --skip 12 --length 2 --format '"$$%X"'`" > music.asm

$(MUSIC_BIN):
	dd if=$(MUSIC) of=music.bin bs=1 skip=128

write: $(EXECUTABLE)
	tools\FamicomDumper.exe script --csfile WriteWarface.cs --sound

erase:
	tools\FamicomDumper.exe script --csfile EraseCheck.cs --sound

.PHONY: clean write erase
