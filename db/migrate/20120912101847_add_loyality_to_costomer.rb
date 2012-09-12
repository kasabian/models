class AddLoyalityToCostomer < ActiveRecord::Migration
  def remove
    remove_column :costomers, :loyalty , :integer
  end
end
