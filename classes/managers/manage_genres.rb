require_relative '../genre'

class ManageGenres
  def initialize(items)
    @items = items
  end

  def list_genres
    if @items.length.positive?
      @items.each_with_index do |item, index|
        puts "#{index + 1}: #{item.class} - #{item.name} published #{item.publish_date}"
      end
      print 'Select item you want to list genre by number: '
      chosen = gets.chomp.to_i
      list_genres unless chosen.between?(1, @items.length)
      if @items[chosen - 1].genre
        puts "1. #{@items[chosen - 1].genre.name}"
      else
        puts 'No Genre for this item!'
      end
    else
      puts 'Add item first!'
    end
  end

  def add_genre
    if @items.length.positive?
      @items.each_with_index do |item, index|
        puts "#{index + 1}: #{item.class} - #{item.name} published #{item.publish_date}"
      end
      print 'Select item you want to add genre by number: '
      chosen = gets.chomp.to_i
      list_genres unless chosen.between?(1, @items.length)
      print 'Please enter the name: '
      name = gets.chomp.to_s
      genre = Genre.new(name)
      genre.add_item(@items[chosen - 1])
      puts 'Genre added succesfully'
    else
      puts 'Add item first!'
    end
  end
end
