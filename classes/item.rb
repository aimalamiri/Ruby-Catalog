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

  def can_be_archived?
    now = Date.today
    difference_in_years = ((now - @publish_date)).to_i
    (difference_in_years / 365).to_i
  end
end
