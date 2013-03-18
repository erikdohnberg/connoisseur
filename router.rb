# Access parameters passed into the app
	
# the 'argument verctor' array
#puts ARGV[0].inspect

if ARGV.empty? # there are no arguments provided
	puts "USAGE: bla bla bla"
else
	puts "Ya, you passed in some arguments :)"
	
	if ARGV[0] == "index"
	elsif ARGV[0] == "show"
	else
		puts "Unrecognized action. Please refer to USAGE"
	end

end
