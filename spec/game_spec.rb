require_relative 'spec_helper'

describe Game do
  context 'Testing Games' do
    before(:each) do
      @game = Game.new('2012-06-12', 'Y', '2011-05-12')
    end

    it 'Should be an instance of the Game class' do
      expect(@game).to be_instance_of Game
    end

    it 'Should return true as the game is a multiplayer' do
      expect(@game.multiplayer).to eq 'Y'
    end

    it 'Should add one game to the collection' do
      expect(@game.last_played_at).to eq '2011-05-12'
    end
  end
end
