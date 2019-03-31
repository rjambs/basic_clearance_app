=begin

Items::ClearItem.call(item: item)

=end

module Items
  module Operations
    class ClearItem < BaseInteractor
      include Interactor::Organizer

      expects do
        required(:item).value(type?: Item)
      end

      organize Items::ComputeClearancePrice,
               Items::ExecuteClearanceSale
    end
  end
end