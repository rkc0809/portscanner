require 'socket'

def ports_scanner(ipaddress, start_port, end_port)
  open_ports = []

  (start_port..end_port).each do |port|
    begin
      socket = TCPSocket.new(ipaddress, port)
      socket.close
      open_ports << port
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      next
    end
  end

  open_ports
end

puts "Please enter the target IP address:"
target_ipaddress = gets.chomp
start_port = 1
end_port = 65535

open_ports = ports_scanner(target_ipaddress, start_port, end_port)

if open_ports.empty?
  puts "No open ports found on target_ipaddress."
else
  puts "Open ports on target_ipaddress: open_ports.join(', ')"
end
