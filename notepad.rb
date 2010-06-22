require File.join(File.dirname(__FILE__), "lib", "display")


while true do
  lines = File.open(ARGV[0], "r").each_line.to_a
  lines = lines.map {|line| line.ljust(56)[0..55]}

  Display.connect("172.23.42.120", 2342) do
    update lines.join
  end

  sleep(2)
end
