module ApplicationHelper
  # Check volume of all items in order

  # Compare volume with available box to discount if box won't fit items

  # If it fits with volume check that it can take biggest item

  # If it can take biggest item check what dimensions are left over

  # Check dimensions for next biggest item

  # Keep going until no items left
end

require 'open-uri'
require 'json'

url = 'https://api.veeqo.com/orders'
response = URI.open(url, "accept" => 'application/json', 'x-api-key' => '20bfb7378be8f369129f67ef180fb044').read
deserialized = JSON.parse(response)


dimensions = []


deserialized.each do |order|
  order_hash = []
  id = order["id"]
  items = order["line_items"]
  items.each do |item|
    order_hash << item["sellable"]["measurement_attributes"]
    dimensions << order_hash
  end
end 
