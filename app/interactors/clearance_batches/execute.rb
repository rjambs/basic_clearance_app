module ClearanceBatches
  class Execute < BaseInteractor  
    expects do
      required(:item_ids_to_clearance).value(type?: String)
    end

    assures do
      required(:clearance_batch).value(type?: String)
    end

    def call
      Item.transaction do
        context.item_ids_to_clearance.each do |item_id|
          item = Item.find(item_id)
          Items::ClearanceSale.call(item: item)
          context.clearance_batch.items << item
        end
      end
    end
  end
end