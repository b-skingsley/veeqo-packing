class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_ref, :string
  end
end
