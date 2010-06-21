require File.join(File.dirname(__FILE__), "lib", "display")

lines = []

File.open( ARGV[0], "r") do |file|
  lines = file.each_line.to_a.map do |line| 
    line.gsub(/\n/, "").ljust(56)
  end
end

text = lines.join

if 1120 < text.length
  raise "text can only be 1120 ascii chars long"
end

Display.connect("127.0.0.1", 2342) do

  response = update text
  puts response

end
