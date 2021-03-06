#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>

#define DELAY 1000

int main() {

	// Put B5 in output mode
	DDRB |= (1 << DDB5);

	while (true) {

		// Set B5 HIGH
		PORTB |= (1 << DDB5);
		_delay_ms(DELAY);

		// Set B5 LOW
		PORTB &= ~ (1 << DDB5);
		_delay_ms(DELAY);
	}

}
