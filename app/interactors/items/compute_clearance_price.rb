module Items
  class ComputeClearancePrice < BaseInteractor
    expects do
      required(:item).value(type?: Item)
    end

    def call
      context.price = item.style.wholesale_price * CLEARANCE_PRICE_PERCENTAGE
    end
  end
end