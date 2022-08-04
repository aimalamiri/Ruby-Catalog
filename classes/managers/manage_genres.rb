require_relative '../genre'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageGenres
  def initialize(genres)
    @genres = genres
    @file_writer = FileWriter.new('genres.json')
    @file_reader = FileReader.new('genres.json')
  end

  def list_genres
    load_genres
    @genres.each do |genre|
      puts "Genre - #{genre.name}"
    end
  end

  def add_genre
    print 'Please enter the name: '
    name = gets.chomp.to_s

    genre = Genre.new(name)
    @genres << genre

    @file_writer.write_data(genre)

    puts "The Genre #{genre.name} has been added successfully!"
  end

  def load_genres
    @genres = @file_reader.read_data
  end
end
