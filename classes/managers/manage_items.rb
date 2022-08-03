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
    send(method_from_type)
  end

  def add_book
    puts 'We can create a book for you! Yay!!!!!!!!'
  end
end
