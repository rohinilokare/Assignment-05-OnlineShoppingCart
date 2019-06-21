require 'csv'
require './newproduct.rb'

class Cart
	def initialize()
		csv1 = CSV.read("cart2.csv")
		@cart_data = Array.new
		i = 0
		attrributes = []
		csv1.each do |row|
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

	def show_cart
		puts '**************************************************'
		cartdata = @cart_data
			puts 'PRODUCT_ID    PRODUCT_NAME    QUANTITY    PRICE/PRODUCT     '
		for item in cartdata
			puts item['PRODUCT_ID'] +"   "+ item['PRODUCT_NAME'] +"    "+item['QUANTITY'] +"    "+item['PRICE/PRODUCT']  
		end
	end

	def bill
		cartdata = @cart_data
		@bill= 0.0
		for item in cartdata
			@bill = item['QUANTITY'].to_f * item['PRICE/PRODUCT'].to_f
		print 'total bill for Product ID '+item['PRODUCT_ID']+', is :'
		puts @bill 
		end
	end

	def remove_item(id)
		cartdata = @cart_data
			CSV.open("cart2.csv","wb") do |inputcsv|
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


end

cart = Cart.new


