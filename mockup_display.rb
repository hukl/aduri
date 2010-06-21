require 'eventmachine'

EventMachine::run do
   EventMachine::open_datagram_socket "127.0.0.1", 2342 do |connection|
     def connection.receive_data d
       puts d.unpack("SSSSSa1120")[-1]
       send_data d
     end
   end
end

