require 'optparse'
require 'subtitler'
options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: bundle exec ruby subtitle.rb [options]'
  opts.on("-f", "--file FILE", "json file") do |f|
    options[:file] = f
  end
  opts.on("-n", "--name NAME", "cloudinary user name") do |f|
    options[:cloud_name] = f
  end

  opts.on("-v", "--video-id VIDEOID", "cloudinary video id") do |f|
    options[:video_id] = f
  end

  opts.on("-h", "--help", "display this help and exit") do |f|
    puts opts
    exit(0)
  end
end.parse!

unless options[:file]
  puts "Error: no file specified"
  exit(1)
else
  file = File.read options[:file]
end

unless options[:cloud_name]
  puts "Error: no cloud name specificed"
end

unless options[:video_id]
  puts "Error: no video id specified"
end

puts Subtitler.addSubtitlesToVideo options[:cloud_name], options[:video_id], file
