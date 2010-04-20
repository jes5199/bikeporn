#!/usr/bin/ruby -s

filename = ARGV[0]

$fps ||= 30
fps = $fps.to_f

if not filename
	raise ArgumentError, "please supply a filename"
end

infile = File.open(filename)

start_frame = 0

infile.each do |line|
	line.chomp!		#remove newline
	line.sub! /\s*#.*/, ""	#remove comments
	break if line.match /STOP/

	if( line.match /START/ )
		File.open('startsecond.txt', 'w') do |timefile|
			timefile.puts( (start_frame / $fps).floor )
		end
		next
	end

	match = line.match /([0-9]+)\s+(.*)/

	next if line.length == 0

	frames = match[1].to_i

	start_frame += frames

	imageFileName = match[2]

	frames.times do
		puts "#{imageFileName}"
	end

end
