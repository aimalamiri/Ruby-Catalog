require_relative './managers/manage_items'
require_relative './managers/manage_labels'

class App
  def initialize
    @items = []
    @labels = []

    @manage_items = ManageItems.new(@items)
    @manage_labels = ManageLabels.new(@labels)
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

  def execute_action
    {
      1 => [@manage_items, 'list_items'], 4 => [@manage_labels, 'list_labels'], 6 => [@manage_items, 'add_item'],
      9 => [@manage_labels, 'add_label']
    }
  end

  def action(action)
    exit if action.zero?
    execute_action[action][0].send(execute_action[action][1])
    run
  end
end
