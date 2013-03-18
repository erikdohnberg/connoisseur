require_relative 'html_generator'

# Access parameters passed into the app
	
# the 'argument verctor' array
#puts ARGV[0].inspect

if ARGV.empty? # there are no arguments provided
	puts "USAGE: bla bla bla"
else
	generator = HTMLGenerator.new
	if ARGV[0] == "index"
		generator.index
	elsif ARGV[0] == "show"
		id = ARGV[1]
		generator.show(id)
	else
		puts "Unrecognized action. Please refer to USAGE"
	end

end