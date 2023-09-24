.DELETE_ON_ERROR:

ROM_US = sfa2-us.sfc
ROM_EU = sfa2-eu.sfc
ROM_JP = sfa2-jp.sfc
ASM = hack.asm
HACK_US = hack-us.sfc
HACK_EU = hack-eu.sfc
HACK_JP = hack-jp.sfc
OBJS = $(HACK_US) $(HACK_EU) $(HACK_JP)

AS = asar
ASFLAGS = --symbols=wla

all: $(OBJS)

$(HACK_US): $(ASM)
	cp $(ROM_US) $(HACK_US)
	$(AS) -DUS=1 $(ASFLAGS) $(ASM) $(HACK_US)

$(HACK_EU): $(ASM)
	cp $(ROM_EU) $(HACK_EU)
	$(AS) -DEU=1 $(ASFLAGS) $(ASM) $(HACK_EU)

$(HACK_JP): $(ASM)
	cp $(ROM_JP) $(HACK_JP)
	$(AS) -DJP=1 $(ASFLAGS) $(ASM) $(HACK_JP)

.PHONY:
clean:
	rm -rf $(OBJS) *.sym
