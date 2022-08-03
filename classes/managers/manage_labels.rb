require_relative '../label'

class ManageLabels
  def initialize(labels)
    @labels = labels
  end

  def list_labels
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
  end
end
