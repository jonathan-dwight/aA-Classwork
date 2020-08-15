require_relative "PolyTreeNode"

class KnightPathFinder

    attr_reader :rootnode
    def initialize(pos)
        @pos = pos
        @rootnode = PolyTreeNode.new(@pos)
        @considered_pos = [@pos]
    end

    def self.valid_moves(pos)
        x, y = pos
        temp = []
        # if we were in the center of the board
        # we could do the following moves
        poss_pos = [[x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y+1], [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
        poss_pos.each do |move|
            if (move[0] >= 0 && move[0] < 8) && (move[1] >= 0 && move[1] < 8)
                temp << move
            end
        end
        temp
    end

    def new_move_positions(pos)
        new_moves = []
        KnightPathFinder.valid_moves(pos).each do |move| 
            if !@considered_pos.include?(move)
                @considered_pos << move
                new_moves << move
            end
        end
        new_moves
    end

    def build_move_tree(end_pos)
        #iterate new positions possible
        #recursively go through those new moves possible, until it reaches the end
        #return an array of the positions

        #we need to build a tree of possible moves that reach to the end pos via recursion

        # so we would build a queue = new_move_positions(@pos)
        # then we would recursively call new_move_pos(queue.pop)
        # start = Queue.new
        # start.enq(@rootnode)
        
        # until start.empty?
        #     positions = new_move_positions(start.deq)
        #     positions.each { |move| start.enq(move) }

        new_move_pos(@pos).each do |move|
            until @pos == end
            move = PolyTreeNode.new(move)
            move.parent = @rootnode
            
        end
        
    end

end