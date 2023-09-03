class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n, '_')}
    end

    def valid?(pos)
        spots = (0...@grid.length).to_a

        pos.all?{ |ele| spots.include?(ele) }
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == '_'
    end

    def place_mark(pos, mark)
        row, col = pos
        if valid?(pos) && empty?(pos)
            @grid[row][col] = mark
            return true
        else
            raise 'Invalid Spot'
            return false
        end
    end

    def print
        @grid.each do |arr|
            p arr
        end
    end

    def win_row?(mark)
        @grid.each do |arr|
            if arr.all?(mark)
                return true
            end
        end
        false
    end

    def win_col?(mark)
        (0...@grid.length).each do |i|
            return @grid.all? do |arr|
                arr[i] == mark
            end
        end
    end

    def win_diagonal?(mark)
        left = []
        right = []
        (0...@grid.length).each do |i|
            left << @grid[i][i]
            right << @grid[i][-1 - i]
        end

        left.all?{ |ele| ele == mark} || right.all?{ |ele| ele == mark}
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |arr|
            arr.each do |ele|
                if ele == '_'
                    return true
                end
            end
        end
        false
    end
end

