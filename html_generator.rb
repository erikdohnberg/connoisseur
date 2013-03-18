class HTMLGenerator
	require "json"
	require "open-uri"

	def show(id)
		print_header
		product = retrieve_data("http://lcboapi.com/products/#{id}.json")
		display_detailed_product(product)
		print_footer
	end

	def index
		print_header
		puts "<h1>All Products</h1>"
		products = retrieve_data("http://lcboapi.com/products.json")
		products.each do |product|
			display_product(product)
		end
		print_footer
	end

	private # Only available to methods within this class

	def retrieve_data(url)
		response = open(url).read
		json_data = JSON.parse(response)
		return json_data["result"]
	end

	def display_product(product)
		puts "<p><h2>#{product['name']}</h2></p>"
		puts "<p><img src='#{product['image_thumb_url']}'></p>"
		puts "		<ul>"
		puts "			<li>Product ID: #{product['id']}</li>"
		puts "			<li>Made by: #{product['producer_name']}</li>"
		puts "			<li>Category: #{product['primary_category']}</li>"
		puts "			<li>Size: #{product['package_unit_volume_in_milliliters']} mL</li>"
		puts "			<li>Price: $#{(product['price_in_cents'].to_i/100.0)}</li>"
		puts "		</ul>"
	end

	def display_detailed_product(product)
		puts "<p><h1>#{product['name']}</h1></p>"
		puts "<p><img src='#{product['image_url']}'></p>"
		puts "		<ul>"
		puts "			<h3><li>Product ID: #{product['id']}</li>"
		puts "			<li>Made by: #{product['producer_name']}</li>"
		puts "			<li>Price: $#{(product['price_in_cents'].to_i/100.0)}</h3></li>"
		puts "			<li>Category: #{product['primary_category']}</li>"
		puts "			<li>Secondary Category: #{product['secondary_category']}</li>"
		puts "			<li>Product Origin: #{product['origin']}</li>" unless product['origin'].nil?
		puts "			<li>Size: #{product['package_unit_volume_in_milliliters']} mL</li>"
		puts "			<li>Package: #{product['package']}</li>"
		puts "			<li>Inventory: #{product['inventory_count']}</li>"
		puts "			<li>Suggested pairing: #{product['serving_suggestion']}</li>" unless product['serving_suggestion'].nil?
		puts "			<li>How it tastes: #{product['tasting_note']}</li>"unless product['tasting_note'].nil?
		puts "			<li>Product tags: #{product['tags']}</li>"
		puts "		</ul>"
	end

	def print_header
		puts "<html>"
		puts "	<head>"
		puts "		<title>Beer Connaisseur</title>"
		puts "		<link type="text/css" rel="stylesheet" href="stylesheet.css"/>"
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