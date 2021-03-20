require 'easy-box-packer'

# get information about a given container, with given items
cont = EasyBoxPacker.pack(
  container: { dimensions: [15, 20, 13], weight_limit: 50 },
  items: [
    { dimensions: [2, 3, 5], weight: 47 },
    { dimensions: [2, 3, 5], weight: 47 },
    { dimensions: [3, 3, 1], weight: 24 },
    { dimensions: [1, 1, 4], weight: 7 },
  ]
)

# find the smallest possible cuboid that items could form
def find_minimum_volume(order)
    array = []
    order.items.each do |item|
        array << { dimensions: item.dimensions }
    end
    EasyBoxPacker.find_smallest_container(items: array)
end

[1, 2, 3]

def compare_min_volume_with_available_boxes(order)
    order_dimensions = find_minimum_volume(order).sort

    for box in sorted_available_boxes do
        box_dimesions = box["dimensions"].sort
        if box_dimensions[0] > order_dimensions[0] && box_dimensions[1] > order_dimensions[1] && box_dimensions[2] > order_dimensions[2]
            chosen_box = box.keys[0]
            break
        end
    end
    chosen_box
end


# available_boxes = {
#                     :envelope => {:dimensions => [31.5, 24, 2], :cost => 8.50},
#                     :pak_1 => {:dimensions => [37, 29.5, 5], :cost => 8.50},
#                     :pak_2 => {:dimensions => [39, 30.5, 2], :cost => 8.50},
#                     :pak_3 => {:dimensions => [44.5, 52.5, 5], :cost => 8.50},
#                     :pak_4 => {:dimensions => [32, 26, 2], :cost => 8.50},
#                     :tube => {:dimensions => [15, 15, 96.5], :cost => 8.50},
#                     :ten_kg => {:dimensions => [40, 33, 25], :cost => 8.50},
#                     :twenty_five_kg => {:dimensions => [55, 42, 33], :cost => 8.50},
#                     :small_one => {:dimensions => [31, 27, 3], :cost => 0.50},
#                     :small_two => {:dimensions => [28, 22, 10], :cost => 8.50},
#                     :medium_one => {:dimensions => [33, 29, 5], :cost => 8.50},
#                     :medium_two => {:dimensions => [28, 22, 10], :cost => 8.50},
#                     :large_one => {:dimensions => [44, 31, 7.5], :cost => 8.50},
#                     :large_two => {:dimensions => [28, 22, 19], :cost => 8.50},
#                     :xl_one => {:dimensions => [29, 27, 28], :cost => 8.50},
#                     :xl_two => {:dimensions => [39, 35, 70], :cost => 8.50}
#                   }

# available_boxes2 = {
#                                     :envelope => {:dimensions => {longest_side: 31.5, second_longest_side: 24, third_longest_side: 2}, :cost => 8.50},
#                                     :pak_1 => {:dimensions => {longest_side: 37, second_longest_side: 29.5, third_longest_side: 5}, :cost => 8.50},
#                                     :pak_2 => {:dimensions => {longest_side: 39, second_longest_side: 30.5, third_longest_side: 2}, :cost => 8.50},
#                                     :pak_3 => {:dimensions => {longest_side: 44.5, second_longest_side: 52.5, third_longest_side: 5}, :cost => 8.50},
#                                     :pak_4 => {:dimensions => {longest_side: 32, second_longest_side: 26, third_longest_side: 2}, :cost => 8.50},
#                                     :tube => {:dimensions => {longest_side: 15, second_longest_side: 15, third_longest_side: 96.5}, :cost => 8.50},
#                                     :ten_kg => {:dimensions => {longest_side: 40, second_longest_side: 33, third_longest_side: 25}, :cost => 8.50},
#                                     :twenty_five_kg => {:dimensions => {longest_side: 55, second_longest_side: 42, third_longest_side: 33}, :cost => 8.50},
#                                     :small_one => {:dimensions => {longest_side: 31, second_longest_side: 27, third_longest_side: 3}, :cost => 0.50},
#                                     :small_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, :cost => 8.50},
#                                     :medium_one => {:dimensions => {longest_side: 33, second_longest_side: 29, third_longest_side: 5}, :cost => 8.50},
#                                     :medium_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, :cost => 8.50},
#                                     :large_one => {:dimensions => {longest_side: 44, second_longest_side: 31, third_longest_side: 7.5}, :cost => 8.50},
#                                     :large_two => {:dimensions => {longest_side: 28, second_longest_side: 22, third_longest_side: 19}, :cost => 8.50},
#                                     :xl_one => {:dimensions => {longest_side: 29, second_longest_side: 27, third_longest_side: 28}, :cost => 8.50},
#                                     :xl_two => {:dimensions => {longest_side: 39, second_longest_side: 35, third_longest_side: 70}, :cost => 8.50}
#                                   }

# useful to iterate through the boxes to find the cheapest possible box that would fit our items
# sorted_available_boxes.sort_by { |k, v| v[:cost] }


