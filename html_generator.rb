class HTMLGenerator
	require "json"
	require "open-uri"

	def show
		print_header
		puts "Action: Show"
		print_footer

	end

	def index
		print_header
		puts "Action: Index"
		print_footer
	
	end

	private # Only available to methods within this class

	def print_header
		puts "<html>"
		puts "	<head>"
		puts "		<title> Connoisseur in the head</title>"
		puts ""
		puts "	</head>"
		puts "	<body>"
		puts ""
	end

	def print_footer
		puts "	</body>"
		puts "</html>"
	end

	def retrieve_data()
		response = open("http://lcboapi.com/products.json").read
		json_data = JSON.parse(response)

	end

end