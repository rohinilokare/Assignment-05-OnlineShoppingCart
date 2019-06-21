require 'csv'
require './newproduct.rb'
require './cart.rb'

puts "Enter Your Name :"
name1 = gets
puts "                                           Hello "+name1
puts "                                           Welcome to online shopping :"
@product = newproduct.new()      #Product class object

more = true
while more == true
	puts '******************************************************'
	puts "Options"
	puts '1.Show Item '
	puts '2.Select Item '
	puts '3.Show Cart '
	puts '4.Remove product from cart'
	puts '5.Exit'
	puts '********************************************************'
	puts 'Enter Your Choice from above option : '
	option = gets.to_i

	case option
		when 1
			@product.view_available_products

		when 2
			@product.select_item

		when 3
			@cart = Cart.new()	
			puts "******************* Your cart *************************"
			@cart.show_cart
			puts '*******************************************************'
			puts 'Do you want to add item to cart ? yes/no? '
				choice = gets.chomp
				choice = choice.to_s
				if choice == 'yes'
					@product.select_item

				else		
					puts '**************************************************'
					puts 'Do you want place order ? yes/no'
					choice = gets.chomp
					choice = choice.to_s
					if choice == 'yes'
					@cart.bill
					else
						@product.view_available_products
					end
						
				end
			
		when 4
			@cart = Cart.new()
								puts '********************Your cart data is :*****************'
					@cart.show_cart
					puts '**************************************************'
					puts 'Enter product id which you want to remove '
					id = gets.to_i
					puts '**************************************************'
					puts 'Do you really want to remove product from cart? yes/no'
					choice = gets.chomp
					choice = choice.to_s
					if choice == 'yes'
					@cart.remove_item(id)
					end
		when 5
			break
		else
			puts "Error: Option has an invalid value (#{option}),Please enter valid Choice"
	end
end


