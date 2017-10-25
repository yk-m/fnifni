#include <Nefry.h>

void setup() {
    // put your setup code here, to run once:
}

void loop() {
    Nefry.setLed(255, 0, 0);
    Nefry.ndelay(1000);
    Nefry.setLed(0, 0, 255);
    Nefry.ndelay(1000);
    Nefry.setLed(0, 255, 0);
    Nefry.ndelay(1000);
}

