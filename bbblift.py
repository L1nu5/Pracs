import Adafruit_BBIO.GPIO as intf
import time

firstFloor  = "P8_8"
secondFloor = "P8_10"
Door = "P8_12"
#secondDoor = "P8_14"


firstSwitch = "P8_7"
secondSwitch = "P8_9"


intf.setup(firstFloor, intf.OUT)
intf.output(firstFloor, intf.HIGH)
intf.setup(secondFloor, intf.OUT)
intf.output(secondFloor, intf.LOW)
intf.setup(Door, intf.OUT)
#intf.setup(secondDoor, intf.OUT)


intf.setup(firstSwitch, intf.IN)
intf.setup(secondSwitch, intf.IN)


while True:
        #main_Logic
        if(intf.input(firstFloor) == intf.HIGH and intf.input(firstSwitch) == intf.LOW):
                intf.output(Door, intf.HIGH)
                time.sleep(3)
				intf.output(Door, intf.LOW)

	if(intf.input(secondFloor) == intf.HIGH and intf.input(secondSwitch) == intf.LOW):
                intf.output(Door, intf.HIGH)
                time.sleep(3)
                intf.output(Door, intf.LOW)

        if(intf.input(firstFloor) == intf.HIGH and intf.input(secondSwitch) == intf.LOW):
                intf.output(firstFloor, intf.LOW)
                time.sleep(3)
                intf.output(secondFloor, intf.HIGH)
                time.sleep(1)
                intf.output(Door, intf.HIGH)
                time.sleep(3)
                intf.output(Door, intf.LOW)

        if(intf.input(secondFloor) == intf.HIGH and intf.input(firstSwitch) == intf.LOW):
                intf.output(secondFloor, intf.LOW)
                time.sleep(3)
                intf.output(firstFloor, intf.HIGH)
                time.sleep(1)
                intf.output(Door, intf.HIGH)
                time.sleep(3)
                intf.output(Door, intf.LOW)




