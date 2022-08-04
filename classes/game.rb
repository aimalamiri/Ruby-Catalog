require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    game_date = DateTime.parse(@last_played_at).to_date
    years = (Date.today.year - game_date.year) > 2
    super && years
  end

  def print_list
    print "\n#{self.class}:|Multiplayer(#{@multiplayer})|Last Palyed: #{@last_played_at}|published: #{@publish_date}\n"
  end
end
