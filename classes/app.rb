class App
  def list_of_options
    { 0 => 'Genere section', 1 => 'Source section', 2 => 'Authors', 3 => 'Labels', 4 => 'Books section',
      5 => 'Music Albums', 6 => 'Games', 7 => 'Exit' }
  end

  def run
    list_of_options.each do |key, value|
      puts "#{key} - #{value}"
    end
    puts 'Choose an option by number: '
    input = gets.chomp.to_i
    exit if input == 7
  end
end
