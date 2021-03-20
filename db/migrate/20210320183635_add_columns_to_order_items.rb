class AddColumnsToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :title, :string
    add_column :order_items, :image_url, :string
    add_reference :order_items, :orders, foreign_key: true
    add_column :order_items, :sku, :string
    add_column :order_items, :weight, :float
    add_column :order_items, :height, :float
    add_column :order_items, :width, :float
    add_column :order_items, :depth, :float
  end
end
