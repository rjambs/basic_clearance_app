  
shared_context "ten typical items" do

  let(:style_type_sweater) { FactoryBot.create(:style_type, name: "Sweater", clearance_price_minimum: BigDecimal.new(2)) }
  let(:style_type_top) { FactoryBot.create(:style_type, name: "Top", clearance_price_minimum: BigDecimal.new(2)) }
  let(:style_type_dress) { FactoryBot.create(:style_type, name: "Dress", clearance_price_minimum: BigDecimal.new(5)) }
  let(:style_type_pants) { FactoryBot.create(:style_type, name: "Pants", clearance_price_minimum: BigDecimal.new(5)) }
  let(:style_type_scarf) { FactoryBot.create(:style_type, name: "Scarf", clearance_price_minimum: BigDecimal.new(2)) }
  
  let(:style_sweater_one) { FactoryBot.create(:style, type: 'Sweater', name: "Soldier Style Sweaters", style_type: style_type_sweater)}
  let(:style_sweater_two) { FactoryBot.create(:style, type: 'Sweater', name: "Cashmere Sweater", style_type: style_type_sweater)}

  let(:style_dress_one) { FactoryBot.create(:style, type: 'Dress', name: "Sunday Dress Floral", style_type: style_type_dress)}
  let(:style_dress_two) { FactoryBot.create(:style, type: 'Dress', name: "Ribbon Dress Formal", style_type: style_type_dress)}

  let(:item_one) { FactoryBot.create(:item, size: "large", color: "red", style: style_sweater_one)}
  let(:item_two) { FactoryBot.create(:item, size: "large", color: "blue", style: style_sweater_one)}
  let(:item_three) { FactoryBot.create(:item, size: "medium", color: "red", style: style_sweater_two)}
  let(:item_four) { FactoryBot.create(:item, size: "medium", color: "red", style: style_sweater_two)}
  let(:item_five) { FactoryBot.create(:item, size: "medium", color: "green", style: style_dress_one)}
  let(:item_six) { FactoryBot.create(:item, size: "small", color: "yellow", style: style_dress_one)}
  let(:item_seven) { FactoryBot.create(:item, size: "small", color: "blue", style: style_dress_one)}
  let(:item_eight) { FactoryBot.create(:item, size: "small", color: "red", style: style_dress_one)}
  let(:item_nine) { FactoryBot.create(:item, size: "small", color: "blue", style: style_dress_two)}
  let(:item_ten) { FactoryBot.create(:item, size: "small", color: "red", style: style_dress_two)}

  let(:items) do
    [
      item_one,
      item_two,
      item_three,
      item_four,
      item_five,
      item_six,
      item_seven,
      item_eight,
      item_nine,
      item_ten,
    ]
  end
  
  before do
    item_one.sell_for_clearance!
    item_two.sell_for_clearance!
    item_three.sell_for_clearance!
    item_four.sell_for_clearance!
    item_five.sell_for_clearance!
    item_six.sell_for_clearance!
    item_seven.sell_for_clearance!
    item_eight.sell_for_clearance!
    item_nine.sell_for_clearance!
    item_ten.sell_for_clearance!
  end
end