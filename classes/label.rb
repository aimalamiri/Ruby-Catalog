require 'securerandom'
require_relative '../modules/jsonable'

class Label
  attr_accessor :title, :color
  attr_reader :items

  include JSONable

  def initialize(title, color)
    @id = SecureRandom.uuid
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
