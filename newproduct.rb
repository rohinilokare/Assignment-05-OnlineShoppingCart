require 'csv'
class Productnew
  def initialize()
	csv = CSV.read("input.csv")
	@data = Array.new
	i = 0
	attrributes = []
	csv.each do |row|
		if i==0
			for atb in row
			  attrributes.push(atb)
			end
		i = i + 1
		else
			item = Hash.new
			j = 0
			for atb in row
				item[attrributes[j]] = atb
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
		for item in csvdata
			puts item['PRODUCT_ID'] +"   "+ item['PRODUCT_NAME'] +"    "+item['AVAILABLE_OUTQNTY'] +"      "+item['PRICE/PRODUCT'] +"     "+item['DISCOUNT'] 
		end
	end 

end



obj = Productnew.new

