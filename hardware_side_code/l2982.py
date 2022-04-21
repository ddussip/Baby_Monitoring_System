import RPi.GPIO as GPIO
from time import sleep
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
Ena,In1,In2=22,17,27
GPIO.setup(Ena,GPIO.OUT)
GPIO.setup(In1,GPIO.OUT)
GPIO.setup(In2,GPIO.OUT)
#PWM=GPIO.PWM(Ena,100)
#PWM.start(0)
x=25
y=1
p=GPIO.PWM(Ena,1000)
p.start(x)
while True:
	p.ChangeDutyCycle(x)
	GPIO.output(In1,GPIO.HIGH)
	GPIO.output(In2,GPIO.LOW)
	sleep(y)
	GPIO.output(In2,GPIO.HIGH)
	GPIO.output(In1,GPIO.LOW)
	sleep(y)
	print(x)
	print(y)
	if x!=50:
		x=x+1;
	if y>0.5:
		y=y-0.1;
	#PWM.ChangeDutyCycle(50)
