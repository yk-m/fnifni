#include <Nefry.h>

void setup() {
    Nefry.setProgramName("LED (Red -> Blue -> Green)");
}

void loop() {
    Nefry.setLed(255, 0, 0);
    Nefry.ndelay(1000);
    Nefry.setLed(0, 0, 255);
    Nefry.ndelay(1000);
    Nefry.setLed(0, 255, 0);
    Nefry.ndelay(1000);
}


