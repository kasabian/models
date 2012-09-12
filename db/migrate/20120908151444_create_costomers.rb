class CreateCostomers < ActiveRecord::Migration
  def change
    create_table :costomers do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
