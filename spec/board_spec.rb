# frozen_string_literal: true

require './board'

describe Board do
  subject(:board_instance) { described_class.new }

  describe '#winning_condition' do
    context 'when its a win' do
      it 'returns true for vertical win' do
        board_instance.board = ['X', nil, nil,
                                'X', nil, nil,
                                'X', nil, nil]
        expect(board_instance.winning_condition).to eq(true)
      end

      it 'returns true for horizontal win' do
        board_instance.board = ['X', 'X', 'X',
                                nil, nil, nil,
                                nil, nil, nil]
        expect(board_instance.winning_condition).to eq(true)
      end

      it 'returns true for diagonal win' do
        board_instance.board = ['X', nil, nil,
                                nil, 'X', nil,
                                nil, nil, 'X']
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
  end
end
