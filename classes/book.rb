require_relative './item'

class Book < Item
  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publiser = publisher
    @cover_state = cover_state
  end
end
