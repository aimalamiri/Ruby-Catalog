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

  def move_to_archive?
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    now = Date.today
    difference_in_years = ((now - @publish_date)).to_i
    should_be_archived = (difference_in_years / 365).to_i
    should_be_archived > 10
  end
end
