# 


require "rails_helper"


describe Items::ComputeClearancePrice do
  include_context "setup items with styles"
  
  describe "success - case 1: " do
    let(:context) { described_class.call(item: item_one)  }

    it "should be 15php" do
      expect(context.price).to eq(BigDecimal.new(15))
    end
  end

  describe "success - case 2: " do
    let(:context) { described_class.call(item: item_two)  }

    it "should be 5php" do
      expect(context.price).to eq(BigDecimal.new(5))
    end
  end

  describe "success - case 2: " do
    let(:context) { described_class.call(item: item_three)  }

    it "should be 2php" do
      expect(context.price).to eq(BigDecimal.new(2))
    end
  end
end