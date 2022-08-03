require_relative './managers/manage_items'

class App
  def initialize
    @items = []
    @manage_items = ManageItems.new(@items)
  end

  def run
    list_of_options.each { |key, value| puts "#{key} - #{value}" }
    puts 'Choose an option by number: '
    action = gets.chomp.to_i
    action(action)
  end

  def list_of_options
    { 1 => 'List all items', 2 => 'List all authors', 3 => 'List all geners', 4 => 'List all labels',
      5 => 'List all music albums', 6 => 'Add new item', 7 => 'Add new author', 8 => 'Add new gener',
      9 => 'Add new label', 10 => 'Add new music album', 0 => 'Exit' }
  end

  def action(action)
    @manage_items.add_item if action == 7
    puts list_of_options[action]
  end
end
