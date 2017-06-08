module Input
  def self.parse(str)
    output = {}
    output[:quantity] = str.split().first()
    tokens = str.split(' at ')
    output[:price] = tokens.last().strip().to_f
    output[:name] = tokens.first().split(output[:quantity]).last().strip()
    output[:type] = check_type(output[:name])
    output[:isimported] = output[:name]=~ /imported/ ? true : false
    output
  end

  def self.check_type(name)
    case
      when name=~ /chocolate/
        'food'
      when name=~ /pill/
        'medical'
      when name=~ /book/
        'book'
      else
        'else'
    end
  end
end