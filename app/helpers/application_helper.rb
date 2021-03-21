# in order to use this within the app, wrap within the helper module
require 'open-uri'
require 'json'
require 'easy-box-packer'

module ApplicationHelper
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

  def available_boxes
    available_boxes = {
                        :envelope => {:dimensions => [31.5, 24, 2], :cost => 8.50, :name => "Envelope"},
                        :pak_1 => {:dimensions => [37, 29.5, 5], :cost => 8.50, :name => "Pak 1"},
                        :pak_2 => {:dimensions => [39, 30.5, 2], :cost => 8.50, :name => "Pak 2"},
                        :pak_3 => {:dimensions => [44.5, 52.5, 5], :cost => 8.50, :name => "Pak 3"},
                        :pak_4 => {:dimensions => [32, 26, 2], :cost => 8.50, :name => "Pak 4"},
                        :tube => {:dimensions => [15, 15, 96.5], :cost => 8.50, :name => "Tube"},
                        :ten_kg => {:dimensions => [40, 33, 25], :cost => 8.50, :name => "10kg Box"},
                        :twenty_five_kg => {:dimensions => [55, 42, 33], :cost => 8.50, :name => "25kg Box"},
                        :small_one => {:dimensions => [31, 27, 3], :cost => 0.50, :name => "Small Box 1"},
                        :small_two => {:dimensions => [28, 22, 10], :cost => 8.50, :name => "Small Box 2"},
                        :medium_one => {:dimensions => [33, 29, 5], :cost => 8.50, :name => "Medium Box 1"},
                        :medium_two => {:dimensions => [28, 22, 10], :cost => 8.50, :name => "Medium Box 2"},
                        :large_one => {:dimensions => [44, 31, 7.5], :cost => 8.50, :name => "Large Box 1"},
                        :large_two => {:dimensions => [28, 22, 19], :cost => 8.50, :name => "Large Box 2"},
                        :xl_one => {:dimensions => [29, 27, 28], :cost => 8.50, :name => "Extra Large Box 1"},
                        :xl_two => {:dimensions => [39, 35, 70], :cost => 8.50, :name => "Extra Large Box 2"}
                      }
  end

  # useful to iterate through the boxes to find the cheapest possible box that would fit our items
  def sorted_available_boxes
    sorted = available_boxes.sort_by { |k, v| v[:cost] }
    Hash[sorted.map {|key, value| [key, value]}]
  end

  # sorted_available_boxes.sort_by { |k, v| v[:cost] }

  # # find the volume of a hash of dimensions
  def volume(hash)
    hash.values.inject(:*)
  end

  def item_volume(item)
    return item.height * item.width * item.depth
  end

  # find the smallest possible cuboid that items could form
  def find_minimum_volume(order)
      array = []
      order.items.each do |item|
          array << { dimensions: item.dimensions }
      end
      EasyBoxPacker.find_smallest_container(items: array)
  end

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

  def format_order(order)
    items = []
    order.order_items.each do |item|
      items << { dimensions: [item.height, item.width, item.depth].sort, weight: item.weight }
    end
    items
  end

  def format_box(box)
    { dimensions: box[1][:dimensions], weight_limit: 50 }
  end

  def compare_min_volume_with_available_boxes(order)
    for box in sorted_available_boxes do
      cont = EasyBoxPacker.pack(
                  container: format_box(box),
                  items: format_order(order)
                )
      # if cont[:errors] != []
      #   puts cont[:errors]
      # end
      if cont[:packings].length == 1 && cont[:errors] == []
        chosen_box = box
        details = cont
        break
      end
    end
    return [chosen_box, details]
  end

  def give_item_positions(details, order)
    # return details[:packings][0][:placements][0][:position]
    array = []
    details[:packings][0][:placements].each do |item|
      array << item[:position]
    end
    names = []
    order.order_items.each do |item|
      names << {name: item.title, volume: item_volume(item)}
    end
    names = names.sort_by { |x| -x[:volume] }
    array.each_with_index do |pos, i|
      names[i] = [names[i][:name], pos]
    end
    names
  end

  def get_xy_coors(details, order)
    final = []
    give_item_positions(details, order).each do |item|
      final << {name: item[0], data: [item[1][0...-1]]}
    end
    final
  end

  def item_placement(position_details)
    bottom_array = []
    above_array = []
    counter = 0
    position_details.each do |item_array|
      if item_array[1][2] == 0
        bottom_array << item_array[0]
        counter += 1
      else
        above_array << item_array[0]
      end
    end
    if counter == position_details.length
      bottom = "Place all items on the bottom of the box in the corresponding order: "
      bottom << bottom_array.join(", ")
      return bottom
    else
      bottom = "First place the following items on the bottom of the box in the corresponding order: "
      bottom << bottom_array.join(", ")
      bottom << ". Then place on top "
      bottom << above_array.join(", ")
      bottom << "."
      return bottom
    end

  end
end
