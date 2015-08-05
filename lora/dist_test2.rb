require 'pi_piper'
include PiPiper

pin22 = PiPiper::Pin.new(:pin => 22, :direction => :out)
watch :pin => 24 do
	puts value
	@begin = Time.now if value == 1
	if value == 0
		@end = Time.now 

		puts "pin 24 change from #{last_value} to #{value} and distance is #{(@end.to_f-@begin.to_f).to_f*170} "
	end
end
loop do
	pin22.on
	#sleep(0.000001)
	pin22.off
	sleep 0.1
end
