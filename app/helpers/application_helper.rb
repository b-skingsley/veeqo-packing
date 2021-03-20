# in order to use this within the app, wrap within the helper module

require 'open-uri'
require 'json'

def extract_dimensions_from_api
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
    dimensions
end



# get the dimensions of every item, in every order from the formatted API data (see line 17), in format [x, y, z]
# plug the extract_dimensions_array method in as the argument
# def format_dimensions(order)
#     order.items

#     end
# end

p format_dimensions(extract_dimensions_from_api)

# find the total volume of every order from the API
# plug the extract_dimensions_array method in as the argument
def volume_of_orders(orders_array)
    (0..(orders_array.size - 1)).each do |index|
        sum = 0
        orders_array[index].each do |item|
            sum += item[1].values[1..3].inject(:*)
        end
        sum
    end
end

available_boxes = {
                    :envelope => {:dimensions => {longest_side: 31.5, second_longest_side: 24, third_longest_side: 2}, :cost => 8.50},
                    :pak_1 => {:dimensions => {longest_side: 37, second_longest_side: 29.5, third_longest_side: 5}, :cost => 8.50},
                    :pak_2 => {:dimensions => {longest_side: 39, second_longest_side: 30.5, third_longest_side: 2}, :cost => 8.50},
                    :pak_3 => {:dimensions => {longest_side: 44.5, second_longest_side: 52.5, third_longest_side: 5}, :cost => 8.50},
                    :pak_4 => {:dimensions => {longest_side: 32, second_longest_side: 26, third_longest_side: 2}, :cost => 8.50},
                    :tube => {:dimensions => {longest_side: 15, second_longest_side: 15, third_longest_side: 96.5}, :cost => 8.50},
                    :ten_kg => {:dimensions => {longest_side: 40, second_longest_side: 33, third_longest_side: 25}, :cost => 8.50},
                    :twenty_five_kg => {:dimensions => {longest_side: 55, second_longest_side: 42, third_longest_side: 33}, :cost => 8.50},
                    :small_one => {:dimensions => {longest_side: 31, second_longest_side: 27, third_longest_side: 3}, :cost => 0.50},
                    :small_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, :cost => 8.50},
                    :medium_one => {:dimensions => {longest_side: 33, second_longest_side: 29, third_longest_side: 5}, :cost => 8.50},
                    :medium_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, :cost => 8.50},
                    :large_one => {:dimensions => {longest_side: 44, second_longest_side: 31, third_longest_side: 7.5}, :cost => 8.50},
                    :large_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 19}, :cost => 8.50},
                    :xl_one => {:dimensions => {longest_side: 29, second_longest_side: 27, third_longest_side: 28}, :cost => 8.50},
                    :xl_two => {:dimensions => {longest_side: 39, second_longest_side: 35, third_longest_side: 70}, :cost => 8.50}
                  }

# useful to iterate through the boxes to find the cheapest possible box that would fit our items
sorted_available_boxes.sort_by { |k, v| v[:cost] }

# # find the volume of a hash of dimensions
def volume(hash)
  hash.values.inject(:*)
end

