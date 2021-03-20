# module ApplicationHelper
    
# end

require 'open-uri'
require 'json'

url = 'https://api.veeqo.com/orders'
response = URI.open(url, "accept" => 'application/json', 'x-api-key' => '20bfb7378be8f369129f67ef180fb044').read
deserialized = JSON.parse(response)


deserialized.each do |order|
  order["line_items"].each do |item|
    p item["sellable"]["measurement_attributes"]["width"]
    p item["sellable"]["measurement_attributes"]["height"]
    p item["sellable"]["measurement_attributes"]["depth"]
    p "------------------------------"
  end
end
