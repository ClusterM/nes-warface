NESASM=tools/NESASM.EXE 
EMU=fceux
SOURCES=music.asm
EXECUTABLE=warface.nes
MUSIC=Warface-11.nsf
MUSIC_BIN=music.bin

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES) $(BIN_FILES) $(MUSIC_BIN)
	rm -f $(EXECUTABLE)
	$(NESASM) $(SOURCES) -o $(EXECUTABLE) --symbols=$(EXECUTABLE) -iWss

$(BIN_FILES): %:
	$(CONVERTER)
$(MUSIC_BIN):
	dd if=$(MUSIC) of=music.bin bs=1 skip=128

build: $(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE) $(MUSIC_BIN) *.lst *.nl

run: $(EXECUTABLE)
	$(EMU) $(EXECUTABLE)
