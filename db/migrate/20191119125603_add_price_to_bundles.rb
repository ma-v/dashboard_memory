class AddPriceToBundles < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :price, :integer
  end
end
