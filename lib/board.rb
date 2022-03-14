class Board
    attr_reader :arr
    def initialize
        @arr = Array.new(6) { Array.new(7) }
    end

    def print
        numbering = " 1 2 3 4 5 6 7"
        @arr.each do |row|
            printed_row = ""
            row.each { |column| column.nil? ? printed_row += " |" : printed_row += "#{column}|" }
            puts "|" + printed_row
        end
        puts numbering
    end


    def full?(column)
        for i in 0..5
            return false if @arr[i][column].nil?
        end    
        true
    end

    def fill(column, value)
        return if self.full?(column)
        temp = 5
        loop do
            if @arr[temp][column].nil?
                return @arr[temp][column] = value
            end
            temp -= 1
        end
    end
    
    def reset
        for i in 0..6
            for j in 0..7
                @arr[i][j] = nil
            end
        end
    end
end