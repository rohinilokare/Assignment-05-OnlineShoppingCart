require 'csv'
class Cart

	def initialize()
		@show_cart=CSV.read("cart1.csv")
	end


	def show_cart
		puts 'PRODUCT_ID      PRODUCT_NAME      QUANTITY      PRICE/PRODUCT         '
		for data in @show_cart
			puts data[0]+"  "+data[1]+"  "+data[2]+"  "+data[3]
		end
	end

	def bill
		@bill= 0.0
		for data in @show_cart
			product_id = data[0]
			x = Float(data[2])
			y = Float(data[3])
			@bill = x*y
		print 'total bill for Product ID '+product_id+', is :'
		puts @bill 
		end
	end

	def remove_item(id)
			puts 'hi'
	end
		

end
