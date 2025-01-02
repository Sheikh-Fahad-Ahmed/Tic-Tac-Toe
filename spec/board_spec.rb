# frozen_string_literal: true

require './board'

describe Board do
  subject(:board_instance) { described_class.new }

  describe '#winning_condition' do
    context 'when winning condition is called' do
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
  end
end
