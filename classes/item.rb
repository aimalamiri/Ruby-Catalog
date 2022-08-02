require 'securerandom'

class Item
  attr_accessor :genre, :author, :label, :source, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = SecureRandom.uuid
    @genre = nil
    @author = nil
    @label = nil
    @source = nil
    @publish_date = publish_date
    @archived = false
  end
end
