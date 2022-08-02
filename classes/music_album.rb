require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date
  attr_reader :items

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
    @items = []
  end

  def can_be_archived?
    super && @on_spotify
  end
end
