require_relative './spec_helper'

describe Author do
  context 'Testing Author' do
    before(:each) do
      @author = Author.new('Anthony', 'Mwenyo')
    end
    it 'Should be instance of the Author class' do
      expect(@author).to be_instance_of Author
    end
    it 'Should have the name equal to Anthony' do
      expect(@author.firstname).to eq 'Anthony'
    end
    item = Item.new('2022-08-03')
    it 'Should add 1 author item to the collection' do
        @author.add_item(item)
        expect(@author.items.length).to eq 1
    end
  end
end
