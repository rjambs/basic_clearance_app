FactoryBot.define do
  factory :style_type do
    name { "Sweater" }
    clearance_price_minimum { BigDecimal.new(3) }
  end
end
