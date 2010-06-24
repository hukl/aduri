require File.join(File.dirname(__FILE__), "lib", "display")

frames = []
frame  = []

File.open(ARGV[0], "r") do |file|
  file.each_line do |line|

    frame << line.ljust(100).gsub(/\n/, "")[7..62]

    if (file.lineno - 1) % 14 == 0
      line.match(/^\d+/)[0].to_i.times do
        frames << frame.join
      end
      frame = []
    end
  end
end

Display.connect("172.23.42.120", 2342) do
  @framerate = 0
  frames.each do |frame|

    start_time = Time.now
    update (frame + @framerate.to_i.to_s.ljust(56))

    sleep(0.04)
    end_time = Time.now

    @framerate = 1 / (end_time - start_time)
  end
end
