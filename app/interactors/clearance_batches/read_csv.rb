module ClearanceBatches
  class ReadCsv < BaseInteractor    
    expects do
      required(:uploaded_file_name).value(type?: String)
    end

    assures do
      required(:item_ids_to_clearance).each(type?: Integer)
    end

    before do
      context.errors = {}
    end

    def call
      CSV.foreach(context.uploaded_file_name, headers: false) do |row|
        potential_item_id = row[0].to_i
        row_handler = Items::Validate.call(item_id: potential_item_id)

        if row_handler.success?
          context.item_ids_to_clearance << row_handler.potential_item_id
        else
          context.errors[potential_item_id] << row_handler.error
        end
      end

      context.fail!(error: "Some rows are problematic: #{context.errors}") dif context.errors.any?
    end
  end
end