require_relative '../lib/cart.rb'

describe Cart do
#items = { "1st" => 0, "2nd" => 0, "3rd" => 0, "4th" => 0, "5th" => 0 }
  before do
    @cart = Cart.new
  end

  context "no discounts" do
    it "buy one 1st" do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(100)
    end

    it "buy 3 1st" do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(300)
    end    
  end

end
