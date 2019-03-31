class Item < ApplicationRecord

  CLEARANCE_PRICE_PERCENTAGE  = BigDecimal.new("0.75")
  DEFAULT_CLEARANCE_PRICE_MIN = BigDecimal.new(2)

  belongs_to :style
  belongs_to :clearance_batch

  scope :sellable, -> { where(status: 'sellable') }

  state_machine :status, :initial => :regular do
    event :sell_for_clearance do
      transition :to => :sellable, :if => :regular?
    end

    event :clear do
      transition :to => :clearanced, :if => :clearable?
    end
  end

  def clearable?
    status == "sellable" && price_sold.present?
  end

end
