require 'csv'
require 'newproduct.rb'
require 'cart.rb'


puts "Enter Your Name :"
name1 = gets
puts "                                           Hello "+name1
puts "                                           Welcome to online shopping :"
@product = Product.new()     					#Product class object
@cart = Cart.new()						#Cart class object

more = true
while more == true
	puts "Options"
	puts '1.Show Item '
	puts '2.Select Item '
	puts '3. Show Cart '
	puts '4. Exit'
	puts 'Enter Your Choice from above option : '
	option = gets.to_i

	case option
		when 1
			@product.view_available_products

		when 2
			@product.select_item

		when 3
			@cart.show_cart
			puts 'Do you want to continue to purchase product ? yes/no'
			choice = gets.chomp
			choice = choice.to_s
			if choice == 'yes'
				@cart.bill
			else
				puts 'Do you want to add item ? '
				choice = gets.chomp
				choice = choice.to_s
				if choice == 'yes'
					@product.select_item
				else
					puts 'Do you want to remove product from cart '
					choice = gets.chomp
					choice = choice.to_s
					if choice == 'yes'
						puts 'Your cart data is :'
						@cart.show_cart
						puts 'enter product id which you want to remove '
						id = gets.to_i
						@cart.remove_item(id)
					else
					@product.view_available_products
				  end
				end
			end


		when 4
			break
	else
			puts "Error: capacity has an invalid value (#{option}),Please enter valid Choice"
	end
end


