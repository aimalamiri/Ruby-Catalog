require_relative '../book'

class ManageItems
  def initialize(items = [])
    @items = items
  end

  def add_item
    types = { 1 => 'Book', 2 => 'Game', 3 => 'Music Album' }
    puts 'Which item do you want to add? Chose by number'
    types.each { |key, value| puts "#{key} - #{value}" }
    choice = gets.chomp.to_i
    method_from_type = types[choice].downcase.split.join('_')
    send("add_#{method_from_type}")
  end

  def add_book
    print 'On which date this book is published? please provide in (dd/mm/yyyy) format: '
    publish_date = gets.chomp.to_s
    print 'Who is the publihser? '
    publisher = gets.chomp.to_s
    print 'How is the cover state now? '
    cover_state = gets.chomp.to_s
    book = Book.new(publish_date, publisher, cover_state)
    @items << book

    puts 'The book has been added successfully!'
  end
end
