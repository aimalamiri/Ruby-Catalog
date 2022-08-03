require_relative './item'
require 'securerandom'

class Author
  attr_accessor :firstname, :lastname
  attr_reader :id, :items

  def initialize(firstname, lastname)
    @id = SecureRandom.uuid
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include?(item)
  end
end
