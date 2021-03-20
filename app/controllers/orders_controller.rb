class OrdersController < ApplicationController

  def index
    Order.destroy_all
    retrieve_orders
    @orders = Order.all
  end

  def show
    @order = Order.find[params[:id]]
    @package = calc_packaging(@order)
  end

  private

  # return an array of order instances
  def retrieve_orders
    veeqo_orders = call_orders_api

    veeqo_orders.each do |order|

      v_id = order["id"]
      order_hash = []
      customer_name = order["customer"]["full_name"]
      items = order["line_items"]

      current_order = Order.create!(v_id: v_id, customer_name: customer_name)

      items.each do |item|
        title = item["sellable"]["product_title"]
        image_url = item["sellable"]["product"]["main_image_src"]
        sku = item["sellable"]["sku_code"]
        weight = item["sellable"]["weight_grams"]
        width = item["sellable"]["measurement_attributes"]["width"]
        height = item["sellable"]["measurement_attributes"]["height"]
        depth = item["sellable"]["measurement_attributes"]["depth"]
        order_item = OrderItem.create!(title: title, image_url: image_url, order_id: current_order.id, sku: sku, weight: weight, width: width , height: height , depth: depth)
      end
    end
  end

  def call_orders_api
    url = 'https://api.veeqo.com/orders'
    response = URI.open(url, "accept" => 'application/json', 'x-api-key' => '20bfb7378be8f369129f67ef180fb044').read
    deserialized = JSON.parse(response)

    return deserialized
  end

  def calc_packaging

  end

end
