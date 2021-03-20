# # module ApplicationHelper
    
# # end

require 'open-uri'
require 'json'

url = 'https://api.veeqo.com/orders'
response = URI.open(url, "accept" => 'application/json', 'x-api-key' => '20bfb7378be8f369129f67ef180fb044').read
deserialized = JSON.parse(response)


dimensions = []
order_hash = {}

deserialized.each_with_index do |order|
  id = order["id"]
  items = order["line_items"]
  items.each_with_index do |item, index|
    order_hash["item #{index + 1}"] = item["sellable"]["measurement_attributes"]
    dimensions << order_hash
  end
end 

AVAILABLE_BOXES = {
                    envelope: {longest_side: 31.5, second_longest_side: 24, third_longest_side: 2},
                    pak_1: {longest_side: 37, second_longest_side: 29.5, third_longest_side: 5},
                    pak_2: {longest_side: 39, second_longest_side: 30.5, third_longest_side: 2},
                    pak_3: {longest_side: 44.5, second_longest_side: 52.5, third_longest_side: 5},
                    pak_4: {longest_side: 32, second_longest_side: 26, third_longest_side: 2},
                    tube: {longest_side: 15, second_longest_side: 15, third_longest_side: 96.5},
                    ten_kg: {longest_side: 40, second_longest_side: 33, third_longest_side: 25},
                    twenty_five_kg: {longest_side: 55, second_longest_side: 42, third_longest_side: 33},
                    small_one: {longest_side: 31, second_longest_side: 27, third_longest_side: 3},
                    small_two: {longest_side: 28, second_longest_side: 22, third_longest_side: 10},
                    medium_one: {longest_side: 33, second_longest_side: 29, third_longest_side: 5},
                    medium_two: {longest_side: 28, second_longest_side: 22, third_longest_side: 10},
                    large_one: {longest_side: 44, second_longest_side: 31, third_longest_side: 7.5},
                    large_two: {longest_side: 28, second_longest_side: 22, third_longest_side: 19},
                    xl_one: {longest_side: 29, second_longest_side: 27, third_longest_side: 28},
                    xl_two: {longest_side: 39, second_longest_side: 35, third_longest_side: 70}
                  }

# find the volume of a hash of dimensions                 
def volume(hash)
  hash.values.inject(:*)
end