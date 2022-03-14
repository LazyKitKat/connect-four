require './lib/game.rb'

describe Game do
    let(:new_game) { Game.new('A', 'B')  }
    
    context 'should return false when checked for a diagonal' do
        it 'returns false when the board is first initialized' do
            expect(new_game.check_diagonal?(new_game.current_player.symbol)).to be(false)
        end
    end

end

