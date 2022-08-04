require_relative '../genre'

class ManageGenres
  def initialize(items)
    @items = items
  end

  def list_genres
    if @items.length.positive?
      @items.each_with_index do |item, _index|
        puts item.print_list
      end
      puts ''
      print 'Select item you want to list genre by order number: '
      chosen = gets.chomp.to_i
      list_genres unless chosen.between?(1, @items.length)
      current_item = @items[chosen - 1]
      if current_item.genre
        puts "1. #{current_item.genre.name}"
      else
        puts 'No Genre for this item!'
      end
    else
      puts 'Add item first!'
    end
  end

  def add_genre
    if @items.length.positive?
      @items.each_with_index do |item, _index|
        puts item.print_list
      end
      puts ''
      print 'Select item you want to add genre by order number: '
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
