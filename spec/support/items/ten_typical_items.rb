  
shared_context "ten typical items" do
  let(:style_sweater_one) { FactoryBot.create(:style, type: 'Sweater', name: "Soldier Style Sweaters")}
  let(:style_sweater_two) { FactoryBot.create(:style, type: 'Sweater', name: "Cashmere Sweater")}

  let(:style_dress_one) { FactoryBot.create(:style, type: 'Dress', name: "Sunday Dress Floral")}
  let(:style_dress_two) { FactoryBot.create(:style, type: 'Dress', name: "Ribbon Dress Formal")}

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