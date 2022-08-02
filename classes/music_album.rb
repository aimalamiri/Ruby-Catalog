require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date)
    super(publish_date)
    @on_spotify = false
  end

  private

  def can_be_archived?
    super.can_be_archived? && @on_spotify == true
  end
end
