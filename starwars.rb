require File.join(File.dirname(__FILE__), "lib", "display")

frames = []
frame  = []

File.open(ARGV[0], "r") do |file|
  file.each_line do |line|

    frame << line.ljust(100).gsub(/\n/, "")[8..63]

    if (file.lineno - 1) % 14 == 0
      frames << frame.join
      frame = []
    end
    break if file.lineno == 15000
  end
end

Display.connect("127.0.0.1", 2342) do
  frames.each do |frame|
    update frame
    sleep(0.1)
  end
end
