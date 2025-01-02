# frozen_string_literal: true

require './board'

describe Board do
  subject(:board_instance) { described_class.new }

  describe '#winning_condition' do
    context 'when its a win' do
      it 'returns true for vertical win' do
        board_instance.board = ['X', 2, 3,
                                'X', 5, 6,
                                'X', 8, 9]
        expect(board_instance.winning_condition).to eq(true)
      end

      it 'returns true for horizontal win' do
        board_instance.board = ['X', 'X', 'X',
                                4, 5, 6,
                                7, 8, 9]
        expect(board_instance.winning_condition).to eq(true)
      end

      it 'returns true for diagonal win' do
        board_instance.board = ['X', 2, 3,
                                4, 'X', 6,
                                7, 8, 'X']
        expect(board_instance.winning_condition).to eq(true)
      end
    end

    context 'When its a draw' do
      it 'returns draw' do
        board_instance.board = ['X', 'O', 'X',
                                'X', 'O', 'O',
                                'O', 'X', 'X']
        expect(board_instance.winning_condition).to eq('draw')
      end
    end

    context 'When there is no winning condition' do
      it 'returns nil' do
        board_instance.board = ['X', 2, 'X',
                                4, 5, 6,
                                7, 8, 9]
        expect(board_instance.winning_condition).to be_nil
      end
    end
  end
end
