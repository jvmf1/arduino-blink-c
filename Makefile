CC=avr-gcc
CFLAGS=-Os -DF_CPU=16000000UL -mmcu=atmega328p
USBPORT:=$(shell ls /dev/ttyAC*)
NAME=blink

all: $(NAME).hex

$(NAME).o: $(NAME).c
	$(CC) $(CFLAGS) $< -c -o $@

$(NAME).out: $(NAME).o
	$(CC) $(CFLAGS) -o $@ $^

$(NAME).hex: $(NAME).out
	avr-objcopy -O ihex -R .eeprom $< $@

flash: $(NAME).hex
	avrdude -F -V -c arduino -p ATMEGA328P -P $(USBPORT) -b 115200 -U flash:w:$<

clean:
	rm -f *.hex *.out *.o
