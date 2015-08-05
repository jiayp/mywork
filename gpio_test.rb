require 'pi_piper'
include PiPiper

#pin23 = PiPiper::Pin.new(:pin => 23, :direction => :in)
watch :pin => 24 do
	puts "pin 23 change from #{last_value} to #{value}"
end

PiPiper.wait
