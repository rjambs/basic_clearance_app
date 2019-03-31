module Items
  class ExecuteClearanceSale < BaseInteractor
    expects do
      required(:item).value(type?: Item)
      required(:price).value(type?: BigDecimal)
    end

    def call
      context.item.update(price_sold: context.price)

      unless context.item.clear
        context.fail!(error: "Item #{context.item.id} failed to be clearanced")
      end
    end
  end
end