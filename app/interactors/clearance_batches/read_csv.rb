require 'csv'

module ClearanceBatches
  class ReadCsv < BaseInteractor    
    expects do
      required(:uploaded_file).value(type?: Tempfile)
    end

    assures do
      required(:items).each(type?: Item)
    end

    before do
      context.errors = {}
      context.items = []
    end

    def call
      CSV.foreach(context.uploaded_file, headers: false) do |row|
        potential_item_id = row[0].to_i
        row_handler = Items::Validate.call(item_id: potential_item_id)
        item = row_handler.item

        if row_handler.success?
          context.items  << item
        else
          context.errors[potential_item_id] = row_handler.error
        end
      end

      context.fail!(error: "Some rows are problematic: #{context.errors}") if context.errors.any?
    end
  end
end