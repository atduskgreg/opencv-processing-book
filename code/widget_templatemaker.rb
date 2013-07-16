require 'bluecloth'

widgetname = ARGV[0]
files = Dir.glob("#{widgetname}/versions/*.pde")

files.each do |md|
	code = File.read("#{md}")
	arr = md.split(".")
	newname = arr.shift
	arr = md.split(".")
	newname = arr.shift
	File.open("#{newname}.md", "w") {|file| 
		file.puts '<!--START BLOCK-->'
		file.puts '<a href="" title=""><img src="" /></a>'
		file.puts '<!--END BLOCK-->'
		file.puts ' '
		file.puts '<!--START BLOCK-->'
		file.puts "<!--Add a tab before each line of code before running widget_makerv2-->"
		file.puts code
		file.puts '<!--END BLOCK-->'
		file.puts ' '
		file.puts '<!--START BLOCK-->'
		file.puts '* Comments list starts here'
		file.puts '<!--END BLOCK-->'
	}
end