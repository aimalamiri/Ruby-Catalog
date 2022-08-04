require_relative './managers/manage_items'
require_relative './managers/manage_labels'
require_relative './managers/manage_genres'

class App
  def initialize
    @items = []

    @manage_items = ManageItems.new(@items)
    @manage_labels = ManageLabels.new(@items)
    @manage_genres = ManageGenres.new(@items)
  end

  def run
    puts ''
    list_of_options.each { |key, value| puts "#{key} - #{value}" }
    puts 'Choose an option by number: '
    action = gets.chomp.to_i
    action(action)
  end

  def list_of_options
    { 1 => 'List all items', 2 => 'List all authors', 3 => 'List all genres',
      4 => 'List all labels', 5 => 'Add new item', 6 => 'Add new author',
      7 => 'Add new genre',
      8 => 'Add new label', 0 => 'Exit' }
  end

  def execute_action
    {
      1 => [@manage_items,
            'list_items'], 3 => [@manage_genres, 'list_genres'],
      4 => [@manage_labels, 'list_labels'], 5 => [@manage_items, 'add_item'],
      7 => [@manage_genres, 'add_genre'], 8 => [@manage_labels, 'add_label']
    }
  end

  def action(action)
    exit if action.zero?
    execute_action[action][0].send(execute_action[action][1])
    run
  end
end
