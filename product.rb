require 'csv'
class Product

  def initialize()
  	@scanfile=CSV.read("input.csv")
  	@priceHash = Hash.new
  	@nameHash = Hash.new
		for data in @scanfile
			@priceHash[data[0]] = data[3]
		end
		
		for data in @scanfile
			@nameHash[data[0]] = data[1]
		end 
  end

	def view_available_products
			puts '******************Available Product List******************************* '
		for data in @scanfile
			puts data[0]+"  "+data[1]+"  "+data[2]+"  "+data[3]+"  "+data[4]
		end
	end


 	
	def select_item
	  view_available_products

		puts '***********Select Product which you want to add **************************'
		puts 'choose product ID '
		product_id = gets.to_i
		puts 'Add no. of quantity '
		quantity = gets.to_i
		print quantity
		CSV.open("file.csv", "a+") do |csv|
			csv << [order_id,product_id,@nameHash["#{product_id}"],quantity,@priceHash["#{product_id}"]]
		end
	end
end
