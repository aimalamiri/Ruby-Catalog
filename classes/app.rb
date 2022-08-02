class App
  def list_of_options
    { 0 => 'Genere section', 1 => 'Source section', 2 => 'Authors', 3 => 'Labels', 4 => 'Books section',
      5 => 'Music Albums', 6 => 'Movies', 7 => 'Exit' }
  end

  def run
    list_of_options.each do |key, value|
      puts "#{key} - #{value}"
    end
  end
end
