require_relative "PolyTreeNode"
require "byebug"

class KnightPathFinder

    attr_reader :rootnode, :pos, :considered_pos
    def initialize(pos)
        @pos = pos
        @rootnode = PolyTreeNode.new(@pos)
        @considered_pos = [@pos]

        build_move_tree
    end

    def self.valid_moves(pos)
        x, y = pos
        temp = []

        poss_pos = [[(x+2), (y+1)], [(x+2), (y-1)], [(x-2), (y+1)], 
        [(x-2), (y+1)], [(x+1), (y+2)], [(x+1), (y-2)], [(x-1), (y+2)], 
        [(x-1), (y-2)]]
        
        #debugger
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

    def build_move_tree
        board_moves = Queue.new
        board_moves.enq(@rootnode)
        
        until board_moves.empty?
            current_node = board_moves.deq
            positions = new_move_positions(current_node.value)
            #debugger
            positions.each do |move| 
                new_pos = PolyTreeNode.new(move)
                current_node.add_child(new_pos)
                board_moves.enq(new_pos)
            end
            # calling new positons on coordinates
            # dealing with nodes to create family tree
            # build tree for all the positions in the map
            # @considered positions will reach an endpoint
        end
    end

    def find_path(end_pos)
        target = @rootnode.dfs(end_pos)
        trace_path_back(target)
    end

    def trace_path_back(node)
        trace = []
        current_node = node
        trace << current_node.value
        until current_node.parent == nil
            trace << (current_node.parent.value)
            current_node = current_node.parent
        end

        trace.reverse!
    end
end