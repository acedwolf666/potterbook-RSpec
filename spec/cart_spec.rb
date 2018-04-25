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

  context "5% off" do

   it "buy one 1st and one 2nd" do
     @cart.add({ "1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0 })
     expect(@cart.calculate).to eq(190)
   end

   it "buy two 1st and two 2nd" do
     @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
     expect(@cart.calculate).to eq(380)
   end

   it "buy one 1st and two 2nd" do
     @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
     expect(@cart.calculate).to eq(290)
   end

   it "buy two 1st and three 2nd" do
     @cart.add({ "1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0 })
     expect(@cart.calculate).to eq(480)
   end

 end
end
