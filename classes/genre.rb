require 'securerandom'
require_relative './item'

class Genre
  attr_accessor :name

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(Item.new(item))
    item.genre << self
  end
end
