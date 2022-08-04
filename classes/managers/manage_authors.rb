require_relative '../author'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageAuthors
  def initialize(authors)
    @authors = authors
    @file_writer = FileWriter.new('authors.json')
    @file_reader = FileReader.new('authors.json')
  end

  def list_authors
    load_authors
    puts 'No author found!' unless @authors.length.positive?
    @authors.each do |author|
      puts "Author - #{author.firstname} #{author.lastname}"
    end
  end

  def add_authors
    print "\nEnter author firstname: "
    firstname = gets.chomp.to_s
    print "\nEnter author lastname: "
    lastname = gets.chomp.to_s
    author = Author.new(firstname, lastname)
    @authors << author
    @file_writer.write_data(author)
    print "\n✅ Author added successfully."
  end

  def load_authors
    @labels = @file_reader.read_data
  end
end
