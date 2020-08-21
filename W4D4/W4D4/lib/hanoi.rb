class Hanoi
    attr_reader :towers

    def initialize(size = 3)
        @towers = []
        @towers[0] = (1..size).to_a.reverse
        @towers[1] = []
        @towers[2] = [] 
    end
    
    def get_move
        p "Provide start and end towers [x, y]"
        input = gets.chomp.split(' ').map(&:to_i)
        input
    end

    def play
        until won?
            puts
            pos = self.get_move
            start = pos[0]
            last = pos[1]
            move(start, last)
            self.display
        end
    end

    def display 
        self.towers.each do |sub|
            puts
            print sub
        end
    end

    def move(start, last)
        return if !@towers[last].empty? && @towers[start][-1] > @towers[last][-1]

        val = @towers[start].pop
        @towers[last].push(val)
    end

    def won?
        @towers[0].empty? && @towers[1].empty?
    end

    # Use rspec to mimic what the class, esp, @towers should look like in a winning-position
    # then run won? and make sure it returns true   

end

test = Hanoi.new
test.play

#move
# (1) only moving top element
# (2) no illegal moves : beyond the towers : throws error
# (3) no illegal moves : larger on top of smaller

# won?
# (1) tell us correctly if we haven't won
# (2) tell us correctly if we have won