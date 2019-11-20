class ChangeUnitPriceToBeFloatInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :unit_price, :float
  end
end
