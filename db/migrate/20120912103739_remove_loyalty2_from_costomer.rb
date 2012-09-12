class RemoveLoyalty2FromCostomer < ActiveRecord::Migration
  def up
    remove_column :costomers, :loyalty
  end

  def down
    add_column :costomers, :loyalty, :integer
  end
end
