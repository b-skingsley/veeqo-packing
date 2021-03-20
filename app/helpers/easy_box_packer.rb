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

# find the smallest possible box
def find_minimum(order)
    array = []
    order.items.each do |item|
        array << { dimensions: item.dimensions }
    end
    container = EasyBoxPacker.find_smallest_container(items: array)
end

available_boxes = {
                    :envelope => {:dimensions => [31.5, 24, 2], :cost => 8.50},
                    :pak_1 => {:dimensions => [37, 29.5, 5], :cost => 8.50},
                    :pak_2 => {:dimensions => [39, 30.5, 2], :cost => 8.50},
                    :pak_3 => {:dimensions => [44.5, 52.5, 5], :cost => 8.50},
                    :pak_4 => {:dimensions => [32, 26, 2], :cost => 8.50},
                    :tube => {:dimensions => [15, 15, 96.5], :cost => 8.50},
                    :ten_kg => {:dimensions => [40, 33, 25], :cost => 8.50},
                    :twenty_five_kg => {:dimensions => [55, 42, 33], :cost => 8.50},
                    :small_one => {:dimensions => [31, 27, 3], :cost => 0.50},
                    :small_two => {:dimensions => [28, 22, 10], :cost => 8.50},
                    :medium_one => {:dimensions => [33, 29, 5], :cost => 8.50},
                    :medium_two => {:dimensions => [28, 22, 10], :cost => 8.50},
                    :large_one => {:dimensions => [44, 31, 7.5], :cost => 8.50},
                    :large_two => {:dimensions => [28, 22, 19], :cost => 8.50},
                    :xl_one => {:dimensions => [29, 27, 28], :cost => 8.50},
                    :xl_two => {:dimensions => [39, 35, 70], :cost => 8.50}
                  }

# useful to iterate through the boxes to find the cheapest possible box that would fit our items                 
sorted_available_boxes.sort_by { |k, v| v[:cost] }


