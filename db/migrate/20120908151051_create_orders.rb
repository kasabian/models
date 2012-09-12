class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :costomer_id
      t.date :cost_date

      t.timestamps
    end
  end
end
