# ClearanceBatches::Operations::ShowReport.call(clearance_batch: clearance_batch)

module ClearanceBatches
  module Operations
    class ShowReport < BaseInteractor
      include Interactor::Organizer

      expects do
        required(:clearance_batch).value(type?: ClearanceBatch)
      end

      def call
        items = context.clearance_batch.items

        grouped_items = items.group_by{|i| [i.size, i.color, i.style_id, i.price_sold]}
        context.summary = []

        grouped_items.each do |group_criteria, items|
          style = Style.find(group_criteria[2])

          row_summary = {
            size: group_criteria[0],
            color: group_criteria[1],
            style_name: style.name,
            style_type: style.style_type.name,
            items_count: items.count,
            wholesale_price: style.wholesale_price,
            price_sold: group_criteria[3],
            revenue: items.sum{|i| i.price_sold}
          }

          context.summary << row_summary
        end
      end
    end
  end
end