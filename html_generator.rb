class HTMLGenerator
	require "json"
	require "open-uri"

	def show
		print_header
		print_footer

	end

	def index
		print_header
		puts "<h1>All Products</h1>"
		print_footer
		products = retrieve_data
		products.each do |product|
			display_product(product)
			display_product_info(product)
		end
	
	end

	private # Only available to methods within this class

	def retrieve_data()
		response = open("http://lcboapi.com/products.json").read
		json_data = JSON.parse(response)
		return json_data["result"]
	end

	def display_product(product)
		puts "<p><h2>#{product['name']}</h2></p>"
		puts "<p><img src='#{product['image_thumb_url']}'></p>"
	end

	def display_product_info(product)
		puts "		<ul>"
		puts "			<li>Product ID: #{product['id']}</li>"
		puts "			<li>Made by: #{product['producer_name']}</li>"
		puts "			<li>Category: #{product['primary_category']}</li>"
		puts "			<li>Secondary Category: #{product['secondary_category']}</li>"
		puts "			<li>Size: #{product['package_unit_volume_in_milliliters']} mL</li>"
		puts "			<li>Price: $#{(product['price_in_cents'].to_i/100.0)}</li>"
		puts "		</ul>"
	end

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

end