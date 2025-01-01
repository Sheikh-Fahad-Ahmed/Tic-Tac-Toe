require './game'
require './player'

describe Game do
  subject(:game_one) { described_class.new }

  describe '#initialize' do
    before do
      allow_any_instance_of(Player).to receive(:gets).and_return('X')
    end

    it 'initializes current_player to X' do
      result = game_one.current_player
      expect(result).to eq('X')
    end
  end
end