require_relative '../author'

class ManageAuthors
  def initialize(items)
    @items = items
  end

  def list_authors
    if @items.size.positive?
      @items.each_with_index do |i, _index|
        print i.print_list
      end
      print 'Select item you want to list author by number: '
      choice = gets.chomp.to_i
      list_authors unless choice.between?(1, @items.length)
      if @items[choice - 1].author
        puts "1. #{@items[choice - 1].author.firstname}"
      else
        puts 'No author for this item!'
      end
    else
      puts 'Add item first!'
    end
  end

  def add_authors
    if @items.size.positive?
      @items.each_with_index do |i, _idx|
        print i.print_list
      end
      print "\nChoose an item number you want to add an author to: "
      choice = gets.chomp.to_i
      add_authors unless choice.between?(1, @items.length)
      print "\nEnter author firstname: "
      firstname = gets.chomp.to_s
      print "\nEnter author lastname: "
      lastname = gets.chomp.to_s
      author = Author.new(firstname, lastname)
      author.add_item(@items[choice - 1])
      print "\n✅ Author added successfully."
    else
      puts 'Add game first❗'
    end
  end
end
