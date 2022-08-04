require_relative '../book'
require_relative '../music_album'
require_relative '../game'
require_relative '../io/file_writer'
require_relative '../io/file_reader'

class ManageItems
  def initialize(items = [])
    @items = items
    @file_writer = FileWriter.new('items.json')
    @file_reader = FileReader.new('items.json')
  end

  def carry_out(action)
    load_items
    types = { 1 => 'Book', 2 => 'Game', 3 => 'Music Album' }
    puts "What do you want to #{action}? Chose by number"
    types.each { |key, value| puts "#{key} - #{value}" }
    choice = gets.chomp.to_i
    method_from_type = types[choice].downcase.split.join('_')
    send("#{action}_#{method_from_type}")
  end

  def list_items
    carry_out('list')
  end

  def add_item
    carry_out('add')
  end

  def list_book
    @items.each do |item|
      puts "#{item.class} - #{item.publisher} published at #{item.publish_date} and the cover is #{item.cover_state}"
    end
  end

  def list_music_album
    @items.each do |item|
      puts "#{item.class} - published at #{item.publish_date} by #{item.name}"
    end
  end

  def list_game
    game_count = 0
    @items.each do |g|
      break unless g.instance_of?(Game)

      game_count += 1
      puts g.print_list
    end
    puts 'No Game has been added yet❗' if game_count <= 0
  end

  def add_book
    print 'On which date this book is published? please provide in (dd/mm/yyyy) format: '
    publish_date = gets.chomp.to_s
    print 'Who is the publisher? '
    publisher = gets.chomp.to_s
    print 'How is the cover state now? '
    cover_state = gets.chomp.to_s
    book = Book.new(publish_date, publisher, cover_state)
    @items << book
    @file_writer.write_data(book)
    puts 'The book has been added successfully!'
  end

  def add_music_album
    print 'Name of the Album: '
    name = gets.chomp.to_s
    print 'On which date this Album is published? please provide in (dd/mm/yyyy) format:  '
    publish_date = gets.chomp.to_s
    print 'Is it on Spotify now? y or n: '
    on_spotify = gets.chomp.to_s
    if %w[y n].include?(on_spotify)
      music_album = MusicAlbum.new(name, publish_date, on_spotify == 'y')
      @items << music_album
      @file_writer.write_data(music_album)
      puts 'The Music album has been added successfully!'
    else
      puts 'Choose the correct option!'
      add_music_album
    end
  end

  def add_game
    print "\n Enter the date on which the game was published in (dd/mm/yyyy) format:"
    publish_date = gets.chomp.to_s
    print "\n Is the game a multiplayer [ Y/N ]: ?"
    multiplayer = gets.chomp.to_s
    print "\n Enter date when the game was last played (dd/mm/yyyy) format:"
    last_played_at = gets.chomp.to_s
    game = Game.new(publish_date, multiplayer, last_played_at)
    @items << game
    @file_writer.write_data(game)
    puts "\n✅ Game successfully added"
  end

  def load_items
    @items = @file_reader.read_data
  end
end
