require_relative 'player'
require_relative 'board'

class Game 
    attr_accessor :current_player, :board
    def initialize(name_one = "", name_two = "")
        welcome()
        puts "Player one name: "
        name_one = gets.chomp
        @player_one = Player.new(name_one, 'X')
        puts "Welcome #{@player_one.name}! Your symbol is #{@player_one.symbol}"
        name_two = gets.chomp
        @player_two = Player.new(name_two, 'O')
        puts "Welcome #{@player_two.name}! Your symbol is #{@player_two.symbol}"
        @board = Board.new
        @current_player = @player_one
    end

    def welcome
        puts "Welcome to connect four. This is a two player game.\nSo get your friend and let's roll."
    end

    def move
        puts "Put in a column number."
        while !win?(@current_player.symbol)
            @board.print
            loop do
                puts "#{@current_player.name}'s move:"
                answer = gets.chomp.to_i - 1
                if answer > 6 or answer < 0
                    puts "Please put in a column number."
                elsif @board.full?(answer)
                    puts "That column is full. Please choose another one."
                else
                    @board.fill(answer, @current_player.symbol)
                    break
                end
            end
            break if draw?() and !win?(current_player.symbol)
            change_player() if !win?(@current_player.symbol)
        end
        @board.print
        if draw?() and !win?(current_player.symbol)
            puts "It's a draw!"
        else
            puts "Congratulations #{@current_player.name}! You won!"
        end
    end

    def draw?
        @board.arr.each do |row|
            row.each { |index| return false if index.nil? }
        end
        true
    end

    def win?(symbol)
        return true if check_row?(symbol) or check_column?(symbol) or up_diagonal?(symbol) or down_diagonal?(symbol)
        
        false
    end

    def up_diagonal?(symbol)
        for i in 3..5
            for j in 0..3
                if @board.arr[i][j] == symbol and @board.arr[i - 1][j + 1] == symbol and @board.arr[i - 2][j + 2] == symbol and @board.arr[i - 3][j + 3] == symbol
                    return true
                end
            end
        end
        false
    end

    def down_diagonal?(symbol)
        for i in 0..2
            for j in 0..3
                if @board.arr[i][j] == symbol and @board.arr[i + 1][j + 1] == symbol and @board.arr[i + 2][j + 2] == symbol and @board.arr[i + 3][j + 3] == symbol
                    return true
                end
            end
        end
        false
    end

    def check_column?(symbol)
        for i in 0..2
            for j in 0..6
                if @board.arr[i][j] == symbol and @board.arr[i + 1][j] == symbol and @board.arr[i + 2][j] == symbol and @board.arr[i + 3][j] == symbol
                    return true
                end
            end
        end
        false
    end

    def check_row?(symbol)
        for i in 0..5
            for j in 0..3
                if @board.arr[i][j] == symbol and @board.arr[i][j + 1] == symbol and @board.arr[i][j + 2] == symbol and @board.arr[i][j + 3] == symbol
                    return true
                end
            end
        end
        false
    end



    def change_player
        if @current_player == @player_one
            @current_player = @player_two
        else
            @current_player = @player_one
        end
    end

    def rematch
        @board = Board.new
        move()
    end
end
