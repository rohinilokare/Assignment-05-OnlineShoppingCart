require 'csv'
require_relative './newproduct'

class Cart
	def initialize()
		csv2 = CSV.read("subfiles/cart2.csv")
		@cart_data = Array.new
		i = 0
		attrributes = []
		csv2.each do |row|
			if i==0
				for element in row
				  attrributes.push(element)
				end
			i = i + 1
			else
				item = Hash.new
				j = 0
				for element in row
					item[attrributes[j]] = element
					j = j+1
				end
				@cart_data.push(item)
			end
	  end
	end

	def show_cart  #this function for display the cart list
		puts '**************************************************'
		cartdata = @cart_data
			puts 'PRODUCT_ID    PRODUCT_NAME    QUANTITY    PRICE/PRODUCT     '
		for item in cartdata
			puts item['PRODUCT_ID'] +"   "+ item['PRODUCT_NAME'] +"    "+item['QUANTITY'] +"    "+item['PRICE/PRODUCT']  
		end
	end

	def generate_bill # this function for generating the bill
		cartdata = @cart_data
		bill_array = []
		bill= 0.0
		for item in cartdata
			bill = item['QUANTITY'].to_f * item['PRICE/PRODUCT'].to_f
		puts 'total bill for Product ID '+item['PRODUCT_ID']+', is :'+bill.to_s
		bill_array.push(bill)
		end
		sum = 0
		for i in bill_array
			sum += i
		end
		puts 'Total Bill for order is : '+sum.to_s
	end

	def remove_item(id)  #this function for removing the item from cart
		cartdata = @cart_data
			CSV.open("subfiles/cart2.csv","wb") do |inputcsv|
			inputcsv << ['PRODUCT_ID','PRODUCT_NAME','QUANTITY','PRICE/PRODUCT']
			for item in cartdata
			  if item['PRODUCT_ID'].to_i == id.to_i
			     next
			  else
			     inputcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],item['QUANTITY'],item['PRICE/PRODUCT']]
			  end
			end
			end
	end

	def check_product(product_id,ordr_quantity)
		cartdata = @cart_data
		CSV.open("subfiles/cart2.csv","wb") do |cartcsv|
			cartcsv << ['PRODUCT_ID','PRODUCT_NAME','QUANTITY','PRICE/PRODUCT']
			for item in cartdata
		  	if item['PRODUCT_ID'].to_i == product_id.to_i
		  		new_quantity = 0
		  		existing_quantity = item['QUANTITY'].to_i
		  		new_quantity = existing_quantity + ordr_quantity.to_i
					cartcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],new_quantity - 1,item['PRICE/PRODUCT']]
		  	else
					#cartcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],ordr_quantity,item['PRICE/PRODUCT']]
					cartcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],item['QUANTITY'],item['PRICE/PRODUCT']]
	  		end
	  	end
		end
	end

end

cart = Cart.new


