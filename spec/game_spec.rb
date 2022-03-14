require './lib/game.rb'

describe Game do
    let(:new_game) { Game.new('A', 'B')  }
    

    context 'when given a row' do
        it 'should return true when 4 in a row' do
            new_game.board.arr = [
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, 'x', nil, nil, nil],
                [nil, nil, 'x', nil, nil, nil, nil],
                [nil, 'x', nil, nil, nil, nil, nil],
                ['x', nil, nil, nil, nil, nil, nil]
            ]
            expect(new_game.up_diagonal?('x')).to be(true)
        end
    end
    

end

