require_relative './spec_helper'

describe Genre do
  context 'When testing the Genre class' do
    genre = Genre.new('Pop')
    music_album = MusicAlbum.new('Thugs', '22/02/2022', true)

    it 'Genre should be an instance of Genre' do
      expect(genre).to be_instance_of Genre
    end

    it 'Genre items should be empty' do
      expect(genre.items.length).to eq 0
    end

    it 'Genre items should be 1 after adding music_album' do
      genre.add_item(music_album)
      expect(genre.items.length).to eq 1
    end
  end
end
