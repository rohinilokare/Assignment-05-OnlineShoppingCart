require 'csv'
require 'cart.rb'

class newproduct
  def initialize()
		csv = CSV.read("input.csv")
		@data = Array.new
		i = 0
		attrributes = []
		csv.each do |row|
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
				@data.push(item)
			end
	  end
	end



	def view_available_products
		csvdata = @data
			puts 'PRODUCT_ID       PRODUCT_NAME        AVAILABLE_OUTQNTY       PRICE/PRODUCT          DISCOUNT'
		for item in csvdata
			puts item['PRODUCT_ID'] +"   "+ item['PRODUCT_NAME'] +"    "+item['AVAILABLE_OUTQNTY'] +"      "+item['PRICE/PRODUCT'] +"     "+item['DISCOUNT'] 
		end
	end 

	def select_item
		@cart2 = Cart.new
	  view_available_products

		puts '***********Select Product which you want to purchase **************************'
		puts 'Choose product ID '
		product_id = gets.to_i
		# product_id = product_id -1
		puts 'Add no. of quantity '
		ordr_quantity = gets.to_i
		#@cart2.check_product(product_id,ordr_quantity)
		add_to_cart(product_id,ordr_quantity)
		update_input_quantity(product_id,ordr_quantity)
		
	end

	def add_to_cart(product_id,new_quantity)
		csvdata = @data
	  for item in csvdata
	  	if item['PRODUCT_ID'].to_i == product_id.to_i
	  		CSV.open("cart2.csv", "a+") do |csv|
	  			csv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],new_quantity,item['PRICE/PRODUCT']]
	  	  end
	  	end	
	  end
	end

	def update_input_quantity(product_id,ordr_quantity)
		csvdata = @data
		CSV.open("input.csv","wb") do |inputcsv|
			inputcsv << ['PRODUCT_ID','PRODUCT_NAME','AVAILABLE_OUTQNTY','PRICE/PRODUCT','DISCOUNT']

			for item in csvdata
			  if item['PRODUCT_ID'].to_i == product_id.to_i
			  	aval_quntity = item['AVAILABLE_OUTQNTY'].to_i
					ordr_quantity = ordr_quantity.to_i
					left_quantity = aval_quntity - ordr_quantity
			  	puts '----------------'
					inputcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],left_quantity,item['PRICE/PRODUCT'],item['DISCOUNT']]
				else
					inputcsv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],item['AVAILABLE_OUTQNTY'],item['PRICE/PRODUCT'],item['DISCOUNT']]
				end
			end
		end

		initialize

	end
end


obj = newproduct.new


