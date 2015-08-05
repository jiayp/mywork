require 'pi_piper'

pin22 = PiPiper::Pin.new(:pin => 22, :direction => :out)
pin24 = PiPiper::Pin.new(:pin => 24, :direction => :in)
loop do
	pin22.on
	sleep(0.00002)
	pin22.off
	v = pin24.read
	puts v
#	pin24.wait_for_change
	while v == 0 do 
		v = pin24.read
	end
	puts v
	@begin = Time.now 	
#	pin24.wait_for_change
	while v == 1 do 
		v = pin24.read
	end
	@end = Time.now 
	puts "dist is #{(@end-@begin)*170}"
	sleep 1
end
