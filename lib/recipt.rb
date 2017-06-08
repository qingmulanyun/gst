class Recipt
  def initialize(basket, total_gst ,total_price )
    @basket = basket
    @total_gst = total_gst
    @total_price = total_price
  end

  def print_details
    @basket.each do |item|
      puts "#{item.quantity} #{item.name}: #{(item.price + item.calculate_tax).round(2)}"
    end

    puts "GST: #{@total_gst.round(2)}"
    puts "Total: #{@total_price.round(2)}"
  end
end