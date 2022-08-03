require_relative './spec_helper'

describe 'Book' do
  it 'can_be_archived? method should return true for publishe date older then 10 years' do
    book = Book.new('22/02/2000', 'Ideal Books Publishing', 'good')
    expect(book.can_be_archived?).to eql(true)
  end

  it 'can_be_archived? method must return false if cover_state is bad and the publish_date is < 10 years ago' do
    book = Book.new('02/02/2022', 'Ideal Books Publishing', 'good')
    expect(book.can_be_archived?).to eql(false)
  end

  it 'can_be_archived? method should return true if the cover_state is bad' do
    book = Book.new('02/02/2022', 'Ideal Books Publishing', 'bad')
    expect(book.can_be_archived?).to eql(true)
  end
end
