class Cart
  PRICE = 100

  def add(items)
    @order_items = items.map{|key,value| value}
  end

  def calculate
    total = 0
    for item in @order_items do
      total += item*PRICE
    end
    return total
  end
end
