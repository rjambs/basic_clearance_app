module ClearanceBatches
  class ClearBatch < BaseInteractor
    include Interactor::Organizer

    expects do
      required(:item).value(type?: String)
    end

    organize Items::ComputeClearancePrice,
             Items::ExecuteClearanceSale
  end
end