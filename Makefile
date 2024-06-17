SRC = Musashi/m68kcpu.c Musashi/softfloat/softfloat.c Musashi/m68kops.c
SRC +=  main.c uart.c csr.c ramrom.c mapper.c scsi.c mbus.c rtc.c

DEPFLAGS = -MT $@ -MMD -MP
CFLAGS=-ggdb -Og -Wall $(DEPFLAGS) -DM68K_COMPILE_FOR_MAME -I.

default: emu

emu: $(SRC:.c=.o)
	$(CC) $(CFLAGS) -o $@  $^ -lm

clean:
	rm -f $(SRC:.c=.o) 
	rm -f emu

-include $(SRC_ALL:.c=.d)
