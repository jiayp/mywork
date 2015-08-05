require 'serialport'
require 'digest/sha1'

s1 = SerialPort.new('/dev/ttyUSB0', 9600)

s1.dtr = 1
s1.rts = 1


def sha1(s)
  s + '|' + Digest::SHA1.hexdigest(s)
end

def send(io, s)
  if s.size > 249
    send(io, s[0..248])
    send(io, s[249..-1])
  else
    io.write(s.size.chr+s)
  end
end
loop do
  send(s1, sha1(rand.to_s))
  sleep 2
end
