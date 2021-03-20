def volume(hash)
  hash.values.inject(:*)
end

box = { longest_side: 10, third_longest_side: 10, second_longest_side: 40 }

items = {
            item_1: { longest_side: 5, third_longest_side: 8, second_longest_side: 10 },
            item_2: { longest_side: 2, third_longest_side: 2, second_longest_side: 10 },
            item_3: { longest_side: 2, third_longest_side: 2, second_longest_side: 10 }
        }





# Methods for adding items' respective measurements
def add_widths(items_hash)
    width_array = []
    items_hash.each do |item|
        width_array << item[1][:longest_side]
    end
    width_array.sum
end

def add_heights(items_hash)
    height_array = []
    items_hash.each do |item|
        height_array << item[1][:third_longest_side]
    end
    height_array.sum
end

def add_depths(items_hash)
    depth_array = []
    items_hash.each do |item|
        depth_array << item[1][:second_longest_side]
    end
    depth_array.sum
end


parcel_to_use = ""

    # AVAILABLE_BOXES.each do |package|
    #     # if volume(package) >= items.each{ |item| volume(item) }.sum
    #     if add_widths(items) <= package[:longest_side]
    #         parcel_to_use = package
    #     elsif add_heights(items) <= package[:third_longest_side]
    #         parcel_to_use = package
    #     elsif add_depths(items) <= package[:second_longest_side]
    #         parcel_to_use = package
    #     else
    #         next
    #     end
    # end


p items.each{ |item| item.each{ |measurement| measurement[0] } }

# p items.each{ |item| volume(item) }



# p volume(box)
# p AVAILABLE_BOXES[:envelope]