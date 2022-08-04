require_relative '../label'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageLabels
  def initialize(labels)
    @labels = labels
    @file_writer = FileWriter.new('labels.json')
    @file_reader = FileReader.new('labels.json')
  end

  def list_labels
    load_labels
    @labels.each do |label|
      puts "Label - #{label.title} is #{label.color}"
    end
  end

  def add_label
    print 'Please enter the title: '
    title = gets.chomp.to_s
    print 'Please enter the color: '
    color = gets.chomp.to_s

    label = Label.new(title, color)
    @labels << label

    @file_writer.write_data(label)

    puts "The label #{label.title} has been added successfully!"
  end

  def load_labels
    @labels = @file_reader.read_data
  end
end
