require './lib/board.rb'

describe Board do
    let(:new_board) { Board.new }
    
    context 'should return false when initialized' do
        it 'returns false when the board is first initialized' do
            expect(new_board.full?(0)).to be(false)
        end
    end

end

