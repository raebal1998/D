import time

# this python library needs to be imported in the raspberry pi
import RPi.GPIO as GPIO


delay = 0.5
pin = None


# Subject to change according to the pins used, therefore set generic and set by the constructor
def construct(out_pin):
    pin = out_pin
    # Choosing the standard board numbering
    GPIO.setmode(GPIO.BOARD)
    # setting the out pin
    GPIO.setup(out_pin, GPIO.OUT)


# This method will let the bulb blink if the car is moving backward
def blink(ismovingback):
    while ismovingback:
        GPIO.output(pin, GPIO.HIGH)
        time.sleep(delay)
        GPIO.output(pin, GPIO.LOW)
        time.sleep(delay)
    GPIO.cleanup()
