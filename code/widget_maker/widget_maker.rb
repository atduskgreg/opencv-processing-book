require 'json'
require 'erb'

target_folder = ARGV[0]

files = Dir.entries("#{target_folder}/versions")

sketch_files = files.select{|f| f =~ /\.pde/}

sketch_name = sketch_files.first.split(/\d/).first

data = {}
data[:title] = "#{sketch_name}.pde"
data[:results] = []

puts "Found #{sketch_files.length} versions."
sketch_files.each do |sketch|
	puts "Loading version #{sketch}"
	sketch_result  = {}
	sketch_result[:code] = open("#{target_folder}/versions/#{sketch}").read

	puts "Enter illustration embed code:"
	sketch_result[:illustration_embed] = STDIN.gets.chomp

	puts "Enter comment (or 0 to exit)"
	sketch_result[:comments] = []
	while (comment = STDIN.gets.chomp) != "0"
		sketch_result[:comments] << comment
		puts "Enter comment (or 0 to exit)"
	end

	data[:results] << sketch_result
end


page_data = data.to_json

template = open("widget_template.erb").read
renderer = ERB.new(template)

puts renderer.result

# File.open("#{target_folder}/widget.html", "w"){|f| f << renderer.render }
