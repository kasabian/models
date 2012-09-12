class RemoveLoyaltyFromCostomer < ActiveRecord::Migration
  def up
    remove_column :costomers, :liyalty
  end

  def down
    add_column :costomers, :liyalty, :integer
  end
end
