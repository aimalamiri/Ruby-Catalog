require_relative './item'
require 'securerandom'
require_relative '../modules/jsonable'

class Author
  attr_accessor :firstname, :lastname
  attr_reader :id, :items

  include JSONable

  def initialize(firstname, lastname)
    @id = SecureRandom.uuid
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end
end
