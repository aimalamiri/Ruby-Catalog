require_relative './spec_helper'

describe 'Label' do
  it 'add_item method must add an item to the items array' do
    label = Label.new('Programming', 'Red')
    book = Book.new('02/02/2022', 'Ideal Books Publishing', 'good')
    label.add_item(book)
    expect(label.items.length).to eql(1)
  end

  it 'add_item method must add itself to the label property of the Item child class' do
    label = Label.new('Programming', 'Red')
    book = Book.new('02/02/2022', 'Ideal Books Publishing', 'good')
    label.add_item(book)
    expect(book.label).to eql(label)
  end
end
