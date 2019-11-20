class ChangePriceToBeFloatInBundles < ActiveRecord::Migration[5.2]
  def change
    change_column :bundles, :price, :float
  end
end
