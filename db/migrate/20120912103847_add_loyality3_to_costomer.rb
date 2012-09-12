class AddLoyality3ToCostomer < ActiveRecord::Migration
  def change
    add_column :costomers, :loyalty, :integer 
  end
end
