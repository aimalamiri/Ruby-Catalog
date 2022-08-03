require_relative 'spec_helper'

describe Game do
  context 'Testing Games' do
    before(:each) do
      @game = Game.new('2011-06-12', 'Y', '2014-05-12')
    end

    it 'Should be an instance of the Game class' do
      expect(@game).to be_instance_of Game
    end

    it 'Should return Y as the game is a multiplayer' do
      expect(@game.multiplayer).to eq 'Y'
    end

    it 'Should have the game last_played_date to equal 2014-05-12' do
      expect(@game.last_played_at).to eq '2014-05-12'
    end

    it 'Should return true as the method can be archived is true' do
      expect(@game.can_be_archived?).to be true
    end
  end
end
