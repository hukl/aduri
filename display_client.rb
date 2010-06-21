require 'socket'

frames = []
frame  = []
File.open("/Users/hukl/Desktop/starwars.txt", "r") do |file|
  file.each_line do |line|

    frame << line.ljust(57).gsub(/\n/, "")

    if (file.lineno - 1) % 14 == 0
      frames << frame.join
      frame = []
    end
    break if file.lineno == 15000
  end
end


content = [
  command     = 3   % 2**16,
  xpos        = 0   % 2**16,
  ypos        = 0   % 2**16,
  xpos_window = 56  % 2**16,
  ypos_window = 20  % 2**16,
  data        = ""
]

UDPSock = UDPSocket.open

frames.each do |frame|
  content[-1] = frame
  UDPSock.send(content.pack("SSSSSa1120"), 0, "172.23.42.120", 2342)
# response = UDPSock.recvfrom(65536)
# puts response
# puts response.join.unpack("SSSSSa1120")
  sleep(0.4)
end
UDPSock.close



