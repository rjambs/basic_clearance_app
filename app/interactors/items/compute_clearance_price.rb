module Items
  class ComputeClearancePrice < BaseInteractor
    expects do
      required(:item).value(type?: Item)
    end

    assures do
      required(:price).value(type?: BigDecimal)
    end

    def call
      clearance_price = context.item.style.wholesale_price * Item::CLEARANCE_PRICE_PERCENTAGE

      context.price = determine_final_clearance_price(clearance_price)
    end


    def determine_final_clearance_price(clearance_price)
      if context.item.style.clearance_price_minimum.nil?
        return clearance_price if clearance_price >= Item::DEFAULT_CLEARANCE_PRICE_MIN
        Item::DEFAULT_CLEARANCE_PRICE_MIN
      else
        return clearance_price if clearance_price >= context.item.style.clearance_price_minimum
        context.item.style.clearance_price_minimum
      end
    end
  end
end