require_relative '../book'

class ManageItems
  def initialize(items = [])
    @items = items
  end

  def carry_out(action)
    types = { 1 => 'Book', 2 => 'Game', 3 => 'Music Album' }
    puts "What do you want to #{action}? Chose by number"
    types.each { |key, value| puts "#{key} - #{value}" }
    choice = gets.chomp.to_i
    method_from_type = types[choice].downcase.split.join('_')
    send("#{action}_#{method_from_type}")
  end

  def list_items
    carry_out('list')
  end

  def add_item
    carry_out('add')
  end

  def list_book
    @items.each do |item|
      puts "#{item.class} - published at #{item.publish_date} by #{item.publisher} and the cover is #{item.cover_state}"
    end
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
