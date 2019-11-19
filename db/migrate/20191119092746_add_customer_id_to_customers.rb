class AddCustomerIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customer_id, :string
  end
end
