# frozen_string_literal: true

FactoryBot.define do
  factory :style do
    wholesale_price { BigDecimal.new(1750) }
    retail_price { BigDecimal.new(5000) }
    type { "Sweater"}
    name { "Golden Fleece Sweater" }
  end
end
