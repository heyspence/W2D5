require_relative "board.rb"
require_relative "human_player.rb"
require "byebug"

class Game
    attr_reader :board

    def initialize(n, *player_mark)
        @players = []
        player_mark.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        old_idx = @players.index(@current_player)
        new_idx = (old_idx + 1) % @players.length
        @current_player = @players[new_idx]
    end

    def play
        conditon = true
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                condition = false
                puts 
                puts 
                puts 'VICTORY'
                puts "Great job #{@current_player.mark_value}!"
                puts
                break
            else
                self.switch_turn
            end
        end
        if condition
            p 'draw - cat won'
        end
    end
end

b = Game.new(3, :X, :O)
b.play


