require 'csv'
class Cart
	@@objects_created = 0
	def initialize()
  	@show_cart=CSV.read("file.csv")
	end

	def show_cart
		for data in @show_cart
			puts data[0]+"  "+data[1]+"  "+data[2]+"  "+data[3]
		end
	end

	def remove_item(id)
		puts id
		for data in show_cart
			puts data[0]
			if data[0] == id
				puts 'delete cart '
			else
				puts 'enter valid Product id'
			end
		end
	end

	def bill
		@bill= 0.0
		for data in @show_cart
			id = data[0]
			x = Float(data[2])
			y = Float(data[3])
			@bill = x*y
		print 'total bill for Product ID '+id+', is :'
		puts @bill 
		end
	end
end
