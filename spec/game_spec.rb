require './game'
require './player'
require './board'

describe Game do
  subject(:game_one) { described_class.new }
  let(:board_instance) { instance_double(Board) }

  before do
    allow(Board).to receive(:new).and_return(board_instance)
  end

  describe '#initialize' do
    before do
      allow_any_instance_of(Player).to receive(:gets).and_return('X')
    end

    it 'initializes current_player to X' do
      result = game_one.current_player
      expect(result).to eq('X')
    end
  end

  describe '#check_winning_condition' do
    context 'when there is a winner' do
      before do
        allow(board_instance).to receive(:winning_condition).and_return(true)
      end

      it 'returns true' do
        expect(game_one).to receive(:winner_message).and_return('winner')
        expect(game_one.check_winning_condition).to eq('winner')
      end
    end

    context 'when there is a draw' do
      before do
        allow(board_instance).to receive(:winning_condition).and_return('draw')
      end

      it 'returns draw' do
        expect(game_one).to receive(:draw_message).and_return('draw')
        expect(game_one.check_winning_condition).to eq('draw')
      end
    end

    context 'when there is no winner or draw' do
      before do
        allow(board_instance).to receive(:winning_condition).and_return(nil)
      end

      it 'returns false' do
        expect(game_one.check_winning_condition).to eq(false)
      end
    end
  end
end