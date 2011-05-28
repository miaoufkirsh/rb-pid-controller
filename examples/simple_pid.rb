
require "../lib/rb-pid-controller/pid.rb"

pid = PID.new(10,1,1)
pid.set_consign(10)

loop do 
  v = 10+ 0.1*(rand-0.5)
  command  =  pid << v
  puts "value : #{v} commande : #{command}"
  sleep 1
end
