# ClearanceBatches::Execute.call(items: items)

module ClearanceBatches
  class Execute < BaseInteractor  
    expects do
      required(:items).value(type?: Array)
    end

    assures do
      required(:clearance_batch).value(type?: ClearanceBatch)
    end

    def call
      create_clearance_batch

      Item.transaction do
        context.items.each do |item|
          Items::Operations::ClearItem.call(item: item)
          context.clearance_batch.items << item
        end
      end
    end

    def create_clearance_batch
      context.clearance_batch = ClearanceBatch.create
    end
  end
end