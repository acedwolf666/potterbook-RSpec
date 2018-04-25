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

  context "10% off" do
    it "buy one 1st, one 2nd and one 3rd" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(270)
    end

    it "buy two 1st, two 2nd and two 3rd" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(540)
    end

    it "buy one 1st, two 2nd and two 3rd" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(460)
    end

    it "buy two 1st, two 2nd and three 3rd" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(640)
    end
  end

  context "15% off" do
    it "buy one 1st, one 2nd, one 3rd and one 4th" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(340)
    end

    it "buy two 1st, two 2nd, two 3rd and two 4th" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 2, "5th": 0 })
      expect(@cart.calculate).to eq(680)
    end

    it "buy one 1st, two 2nd, two 3rd and two 4th" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 2, "4th": 2, "5th": 0 })
      expect(@cart.calculate).to eq(610)
    end

    it "buy two 1st, two 2nd, two 3rd and three 4th" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 3, "5th": 0 })
      expect(@cart.calculate).to eq(780)
    end

    it "buy two 1st, three 2nd, four 3rd and five 4th" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 4, "4th": 5, "5th": 0 })
      expect(@cart.calculate).to eq(1240)
    end
  end
end
