class AmendOrderItemsColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_items, :orders_id, :order_id
  end
end
