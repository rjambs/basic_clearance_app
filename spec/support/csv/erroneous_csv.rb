shared_context "erroneous csv" do  
  include_context "ten typical items"    

  let(:csv_filename) { "#{Rails.root}/tmp/batch_#{Time.now.to_i}.csv" }

  before do
    CSV.open(csv_filename, "wb") do |csv|
      items.each do |item_row|
        if item_row.kind_of?(Item)
          csv << [
            item_row.id, 
            item_row.size, 
            item_row.color, 
            item_row.status, 
            '', 
            '', 
            item_row.style_id, 
            item_row.created_at, 
            item_row.updated_at
          ]
        else
          # assumes an array of strings
          csv << item_row
        end
      end

      csv << [
        99,
        'large',
        'red',
        'sellable',
        '',
        '',
        1,
        Time.zone.now - 1.day,
        Time.zone.now - 1.day
      ]
    end
  end
end