class AddPopulatToItem < ActiveRecord::Migration
  def change
    add_column :items, :popular, :integer
  end
end
