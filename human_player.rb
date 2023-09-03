class HumanPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        print 'Player ', @mark_value, ' enter position: '
        spot = gets.chomp.split(" ")
        spot.map { |ele| ele.to_i }
    end
end