# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    style
    color { "red" }
    size { "medium" }
    status { "regular" }
  end
end
