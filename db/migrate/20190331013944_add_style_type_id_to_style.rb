class AddStyleTypeIdToStyle < ActiveRecord::Migration[5.1]
  def change
    add_column :styles, :style_type_id, :integer
  end
end
