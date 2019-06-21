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
	puts x = csvdata[0]
	puts x['PRODUCT_NAME']
	end 


	def select_item
	  view_available_products

		puts '***********Select Product which you want to add **************************'
		puts 'Choose product ID '
		product_id = gets.to_i
		product_id = product_id -1
		puts 'Add no. of quantity '
		quantity = gets.to_i
		csvdata = get_data
		id = csvdata[product_id] 
		name = id['PRODUCT_NAME']
		CSV.open("cart1.csv", "a+") do |csv|
			#csv << ["PRODUCT_ID", "PRODUCT_NAME", "QUANTITY","PRICE/PRODUCT"]
			csv << [id['PRODUCT_ID'],id['PRODUCT_NAME'],quantity,id['PRICE/PRODUCT']]
		end
	end

end



obj = Productnew.new


