# bundle exec rspec spec/interactors/items/operations/clear_item_spec.rb

require "rails_helper"

describe Items::Operations::ClearItem do
  include_context "setup items with styles"

  describe "success case" do
    let(:context) do 
      described_class.call(item: item_one)
    end

    it "should have an item with price_sold 15" do
      expect(context.item.price_sold).to eq(BigDecimal.new(15))
    end

    it "should have an item with a cleared status" do
      expect(context.item).to be_clearanced
    end

    it "should success" do
      expect(context).to be_a_success
    end
  end

  describe "failure case - fail if default state" do
    let(:context) { described_class.call(item: item_one) }

    before do
      item_one.update(status: "regular")
    end

    it "should fail" do
      expect(context).to be_a_failure
    end
  end
end