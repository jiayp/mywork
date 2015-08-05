require 'wiringpi'
loop do
io = WiringPi::GPIO.new
io.pin_mode(3, WiringPi::OUTPUT)
io.pin_mode(5, WiringPi::INPUT)
io.digital_write(3, 1)
#io.delay_microseconds(1)
io.digital_write(3, 0)
v = 0
#puts io.digital_read(5)
@t = io.millis
while io.digital_read(5) == 0 do 
	break if (io.millis - @t) > 100
end
#Wiringpi.waitForInterrupt()
@begin = io.micros
while io.digital_read(5) == 1 do 
	break if (io.micros - @begin) > 100000
end
#Wiringpi.waitForInterrupt()
@end = io.micros

puts (@end-@begin)*170.0/1000000
sleep 1
end
