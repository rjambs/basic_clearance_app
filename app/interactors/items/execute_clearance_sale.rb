module Items
  class ExecuteClearanceSale < BaseInteractor
    expects do
      required(:item).value(type?: Item)
      required(:clearance_price).value(type?: BigDecimal)
    end

    def call
      price = Items::ComputeClearancePrice.call(item: item).price

      unless item.clear!(price_sold: price)
        context.fail!(error: "Item #{item.id} failed to be clearanced")
      end
    end
  end
end