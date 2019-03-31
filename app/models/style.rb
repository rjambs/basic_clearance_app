class Style < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_many :items
  belongs_to :style_type
end
