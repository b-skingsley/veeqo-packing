require 'easy-box-packer'

# cont = EasyBoxPacker.pack(
#   container: { dimensions: [15, 20, 13], weight_limit: 50 },
#   items: [
#     { dimensions: [2, 3, 5], weight: 47 },
#     { dimensions: [2, 3, 5], weight: 47 },
#     { dimensions: [3, 3, 1], weight: 24 },
#     { dimensions: [1, 1, 4], weight: 7 },
#   ]
# )

# find the smallest possible box
container = EasyBoxPacker.find_smallest_container(
    items: Array.new(1000) {{ dimensions: [1, 1, 1] }}
  )

available_boxes {
                    envelope: {dimensions: {longest_side: 31.5, second_longest_side: 24, third_longest_side: 2}, cost: 0.5},
                    pak_1: {dimensions: {longest_side: 37, second_longest_side: 29.5, third_longest_side: 5}, cost: 1.2},
                    pak_2: {dimensions: {longest_side: 39, second_longest_side: 30.5, third_longest_side: 2}, cost: 1.4},
                    pak_3: {dimensions: {longest_side: 44.5, second_longest_side: 52.5, third_longest_side: 5}, cost: 1.5},
                    pak_4: {dimensions: {longest_side: 32, second_longest_side: 26, third_longest_side: 2}, cost: 2.5},
                    tube: {dimensions: {longest_side: 15, second_longest_side: 15, third_longest_side: 96.5}, cost: 2.8},
                    ten_kg: {dimensions: {longest_side: 40, second_longest_side: 33, third_longest_side: 25}, cost: 2.85},
                    twenty_five_kg: {dimensions: {longest_side: 55, second_longest_side: 42, third_longest_side: 33}, cost: 3.1},
                    small_one: {dimensions: {longest_side: 31, second_longest_side: 27, third_longest_side: 3}, cost: 4.0},
                    small_two: {dimensions: {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, cost: 4.60},
                    medium_one: {dimensions: {longest_side: 33, second_longest_side: 29, third_longest_side: 5}, cost: 5},
                    medium_two: {dimensions: {longest_side: 28, second_longest_side: 22, third_longest_side: 10}, cost: 5.50},
                    large_one: {dimensions: {longest_side: 44, second_longest_side: 31, third_longest_side: 7.5}, cost: 5.90},
                    large_two: {dimensions: {longest_side: 28, second_longest_side: 22, third_longest_side: 19}, cost: 7},
                    xl_one: {dimensions: {longest_side: 29, second_longest_side: 27, third_longest_side: 28}, cost: 8.50},
                    xl_two: {dimensions: {longest_side: 39, second_longest_side: 35, third_longest_side: 70}, cost: 10.50}
                  }
