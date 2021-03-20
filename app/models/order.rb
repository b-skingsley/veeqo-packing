class Order < ApplicationRecord
  attr_reader :id, :customer_name, :items

  def initialize(props)
    @id = props[:id]
    @customer_name = props[:customer_name]
    @items = props[:items]
  end
end
