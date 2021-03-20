class OrderItem < ApplicationRecord
  attr_reader :title, :image_url, :sku, :weight, :width, :height, :depth, :dimensions

  def initialize(props)
    @title = props[:title]
    @image_url = props[:image_url]
    @sku = props[:sku_code]
    @weight = props[:weight]
    @width = props[:width]
    @height = props[:height]
    @depth = props[:depth]
    @dimensions = calc_dimensions
  end

  private

  def calc_dimensions
    [@width, @height, @depth]
  end
end
