require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :items

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
