require_relative './spec_helper'

describe MusicAlbum do
  context 'When testing the MusicAlbum class' do
    publish_date = '22/02/2001'
    music_album = MusicAlbum.new('Thugs', publish_date, true)

    it 'music_album should be an instance of MusicAlbum' do
      expect(music_album).to be_instance_of MusicAlbum
    end

    it 'music_album.can_be_archived? should return true' do
      expect(music_album.can_be_archived?).to be true
    end
  end
end
