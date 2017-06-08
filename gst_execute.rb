require './lib/input.rb'
require './lib/item.rb'
require './lib/recipt.rb'


file_name = ARGV[0]
total_price = 0
total_tax = 0
basket = []

File.open(file_name, "r") do |infile|
  while (line = infile.gets)
    element = Input.parse(line)
    item = Item.new(element[:name],element[:price],element[:type],element[:isimported],element[:quantity])
    basket.push(item)
  end


  basket.each do |item|
    total_price += item.cost
    total_tax += item.calculate_tax
  end

  recipt = Recipt.new(basket, total_tax, total_price)
  recipt.print_details()
end