require_relative '../label'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageLabels
  def initialize(items)
    @items = items
    @file_writer = FileWriter.new('labels.json')
    @file_reader = FileReader.new('labels.json')
  end

  def list_labels
    if @items.length.positive?
      @items.each_with_index do |item, _index|
        puts item.print_list
      end
      puts ''
      print 'Select item you want to list label by order number: '
      chosen = gets.chomp.to_i
      list_labels unless chosen.between?(1, @items.length)
      current_item = @items[chosen - 1]
      if current_item.label
        puts "1. #{current_item.label.title} is #{current_item.label.color}"
      else
        puts 'No Label for this item!'
      end
    else
      puts 'Add item first!'
    end
  end

  def add_label
    if @items.length.positive?
      @items.each_with_index do |item, _index|
        puts item.print_list
      end
      puts ''
      print 'Select item you want to add label by order number: '
      chosen = gets.chomp.to_i
      list_labels unless chosen.between?(1, @items.length)
      print 'Please enter the title: '
      title = gets.chomp.to_s
      print 'Please enter the color: '
      color = gets.chomp.to_s
      label = Label.new(title, color)
      label.add_item(@items[chosen - 1])
      @file_writer.write_data(label)
      puts 'Label added succesfully'
    else
      puts 'Add item first!'
    end
  end

  def load_labels
    @labels = @file_reader.read_data
  end
end
