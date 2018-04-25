class Cart
  PRICE = 100

  def add(items)
    @ordered_items = items.map{|key,value| value}
  end

  def calculate
    total = 0
    @ordered_items = @ordered_items.delete_if{ |i| i == 0 }

    while @ordered_items.size > 0
      if @ordered_items.size == 2
        total += 2*PRICE*0.95
        @ordered_items[0] -= 1
        @ordered_items[1] -= 1
        @ordered_items = @ordered_items.delete_if{ |i| i == 0 }
      else
        total += PRICE
        @ordered_items[0] -= 1
        @ordered_items = @ordered_items.delete_if{ |i| i == 0 }
      end
    end

    return total
  end
end
