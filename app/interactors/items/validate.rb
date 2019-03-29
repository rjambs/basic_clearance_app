module Items
  class Validate < BaseInteractor      
    expects do
      required(:item_id).value(type?: String)
    end

    def call
      check_item_id_validity
      check_item_existence
      check_item_sellability
    end

    def check_item_id_validity
      return unless context.item_id.blank? || context.item_id.zero? || !context.item_id.is_a?(Integer)
      
      context.fail!(error: "Item id #{context.item_id} is not valid")    
    end

    def check_item_existence
      return if Item.where(id: context.item_id).exists?

      context.fail!(error: "Item id #{context.item_id} could not be found")      
    end

    def check_item_sellability
      return if Item.sellable.where(id: context.item_id).exists?
      
      context.fail!(error: "Item id #{context.item_id} could not be clearanced")
    end
  end
end