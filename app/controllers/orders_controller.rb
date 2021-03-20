class OrdersController < ApplicationController

  def index
    @orders = create_orders
  end

  def show
    @order = @orders[id: params[:id]]
    @package = calc_packaging(@order)
  end

  private

  # return an array of order instances
  def create_orders
    veeqo_orders = call_orders_api
    current_orders = []

    veeqo_orders.each do |order|

      id = order["id"]
      order_hash = []
      customer_name = order["customer"]["full_name"]
      items = order["line_items"]

      order_items = []

      items.each do |item|
        title = item["sellable"]["product_title"]
        image_url = item["sellable"]["product"]["main_image_src"]
        sku = item["sellable"]["sku_code"]
        weight = item["sellable"]["weight_grams"]
        width = item["sellable"]["measurement_attributes"]["width"]
        height = item["sellable"]["measurement_attributes"]["height"]
        depth = item["sellable"]["measurement_attributes"]["depth"]
        order_item = OrderItem.new(title: title, image_url: image_url, sku: sku, weight: weight, width: width , height: height , depth: depth)
        order_items << order_item
      end

      current_orders << Order.new(id: id, customer_name: customer_name, items: order_items)
    end

    return current_orders
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
