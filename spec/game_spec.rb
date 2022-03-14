require './lib/game.rb'

describe Game do
    let(:new_game) { Game.new('A', 'B')  }
    

    context 'when nil value in the array' do
        it 'draw? should return false' do
            new_game.board.arr = [
                ['o', 'x', 'o', 'x', 'o', 'x', 'o'],
                ['x', 'o', 'x', 'o', 'x', 'o', 'x'],
                ['o', 'x', 'o', 'x', 'o', 'x', 'o'],
                ['x', 'o', 'x', 'o', 'x', 'o', 'x'],
                ['o', 'x', 'o', 'x', 'o', 'x', 'o'],
                ['x', 'o', 'x', 'o', 'x', 'o', nil]
            ]
            expect(new_game.draw?).to be(false)
        end
    end
    

end

