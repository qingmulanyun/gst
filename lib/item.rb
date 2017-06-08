class Item
  attr_accessor :name, :price, :type, :isimported, :quantity

  SALES_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  TAX_FREE_TYPE = ['book', 'medical', 'food']


  def initialize(name, price, type, isimported, quantity)
    @name = name
    @price = price
    @type = type
    @isimported = isimported
    @quantity = quantity.to_i
  end

  def tax_rate
    sales_tax_rate + inported_tax_rate
  end

  def sales_tax_rate
    TAX_FREE_TYPE.include?(type) ? 0 : SALES_TAX_RATE
  end

  def inported_tax_rate
    isimported ? IMPORT_TAX_RATE : 0
  end


  def calculate_tax
    (price * tax_rate * 20).ceil / 20.0
  end

  def cost
    price + calculate_tax
  end
end