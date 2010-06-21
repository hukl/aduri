require 'eventmachine'

EventMachine::run do
   EventMachine::open_datagram_socket "127.0.0.1", 2342 do |connection|
     def connection.receive_data data
       data = data.unpack("SSSSSa1120")
       puts data[-1]
       data[0] = 0
       send_data data.pack("SSSSSa1120")
     end
   end
end

