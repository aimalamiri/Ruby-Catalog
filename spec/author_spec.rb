require_relative './spec_helper'

describe Author do
  context 'Testing Author' do
    before(:each) do
      @author = Author.new('Anthony', 'Mwenyo')
    end
    it 'Should be instance of the Author class' do
      expect(@author).to be_instance_of Author
    end
    it 'Should have the firstname equal to Anthony' do
      expect(@author.firstname).to eq 'Anthony'
    end

    it 'Should add 1 item of game info to items collection' do
      item = Game.new('2012-08-03', 'Y', '2015-08-07')
      @author.add_item(item)
      expect(@author.items.length).to eq 1
    end
  end
end
