class AddClearancePriceMinimumToStyle < ActiveRecord::Migration[5.1]
  def change
    add_column :styles, :clearance_price_minimum, :decimal
  end
end
