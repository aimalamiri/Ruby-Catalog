require 'securerandom'
require_relative './item'
require_relative '../modules/jsonable'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  include JSONable

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
