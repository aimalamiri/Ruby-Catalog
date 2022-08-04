require_relative '../genre'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageGenres
  def initialize(labels)
    @labels = labels
    @file_writer = FileWriter.new('labels.json')
    @file_reader = FileReader.new('labels.json')
  end

  def list_genres
    load_labels
    @labels.each do |label|
      puts "Genre - #{label.name}"
    end
  end

  def add_genre
    print 'Please enter the name: '
    name = gets.chomp.to_s

    genre = Genre.new(name)
    @labels << genre

    @file_writer.write_data(genre)

    puts "The label #{genre.name} has been added successfully!"
  end

  def load_labels
    @labels = @file_reader.read_data
  end
end
