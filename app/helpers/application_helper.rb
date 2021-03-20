# module ApplicationHelper
    
# end

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

