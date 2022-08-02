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
end
