require 'securerandom'
require_relative './item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
