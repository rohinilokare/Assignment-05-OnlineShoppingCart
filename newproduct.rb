require 'csv'
class Productnew
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
	 
	def get_data()
	  	return @data
  end

	def view_available_products
		csvdata = get_data
			puts 'PRODUCT_ID       PRODUCT_NAME        AVAILABLE_OUTQNTY       PRICE/PRODUCT          DISCOUNT'
		for item in csvdata
			puts item['PRODUCT_ID'] +"   "+ item['PRODUCT_NAME'] +"    "+item['AVAILABLE_OUTQNTY'] +"      "+item['PRICE/PRODUCT'] +"     "+item['DISCOUNT'] 
		end
	end 

	def select_item
	  view_available_products

		puts '***********Select Product which you want to add **************************'
		puts 'Choose product ID '
		product_id = gets.to_i
		# product_id = product_id -1
		puts 'Add no. of quantity '
		ordr_quantity = gets.to_i
		add_to_cart(product_id,ordr_quantity)
		update_quantity(product_id,ordr_quantity)
		
	end

	def add_to_cart(product_id,ordr_quantity)
		csvdata = get_data
	  for item in csvdata
	  	if item['PRODUCT_ID'].to_i == product_id.to_i
	  		CSV.open("cart1.csv", "a+") do |csv|
	  			csv << [item['PRODUCT_ID'],item['PRODUCT_NAME'],ordr_quantity,item['PRICE/PRODUCT']]
	  	  end
	  	end	
	  end
	end



	def update_quantity(product_id,ordr_quantity)
		csvdata = get_data
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

		rewrite_input

	end


	def rewrite_input
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
	  get_data()
	end

end




obj = Productnew.new


