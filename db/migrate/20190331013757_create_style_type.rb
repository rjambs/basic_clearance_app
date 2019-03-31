class CreateStyleType < ActiveRecord::Migration[5.1]
  def change
    create_table :style_types do |t|
      t.string :name
      t.decimal :clearance_price_minimum
    end
  end
end
