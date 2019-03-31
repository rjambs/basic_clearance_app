# require spec/support/items/typical_setup.rb

# include_context "setup items with styles"

shared_context "setup items with styles" do
  let(:style_sweater_one) do 
    FactoryBot.create(:style, type: 'Sweater',
                              name: "Soldier Style Sweaters",
                              wholesale_price: BigDecimal.new(20),
                              retail_price: BigDecimal.new(50)
                      )
  end

  let(:style_sweater_two) do 
    FactoryBot.create(:style, type: 'Sweater',
                              name: "Cashmere Sweater",
                              wholesale_price: BigDecimal.new(6),
                              retail_price: BigDecimal.new(50),
                              clearance_price_minimum: BigDecimal.new(5)
                      )
  end

  let(:style_sweater_three) do 
    FactoryBot.create(:style, type: 'Sweater',
                              name: "Leather Sweater",
                              wholesale_price: BigDecimal.new(2.2, 8),
                              retail_price: BigDecimal.new(50)
                      )
  end

  let(:item_one) { FactoryBot.create(:item, size: "large", color: "red", style: style_sweater_one, status: 'sellable')}
  let(:item_two) { FactoryBot.create(:item, size: "large", color: "red", style: style_sweater_two, status: 'sellable')}
  let(:item_three) { FactoryBot.create(:item, size: "large", color: "red", style: style_sweater_three, status: 'sellable')}

  let(:items) { [item_one, item_two, item_three]}
end