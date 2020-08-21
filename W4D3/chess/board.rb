require_relative "./piece.rb"

class Board
    attr_reader :board 

    def initialize
        @sentinel = NullPiece.instance
        @board = Board.populate_board
    end

    def self.populate_board
        
        board = Array.new(8) { Array.new(8) }

        board.each_with_index do |row,row_i|
            row.each_with_index do |pos,col_i|
                if pos == nil
                    board[row_i][col_i] = sentinel
                end
            end
        end

        (0..7).each do |i|

            board[1][i] = Pawn.new("white", self, [1,i])
            board[6][i] = Pawn.new("black", self, [6,i])

            if i == 0 || i == 7
                board[0][i] = Rook.new("white", self, [0,i])
                board[7][i] = Rook.new("black", self, [7,i])
            elsif i == 1 || i == 6
                board[0][i] = Knight.new("white", self, [0,i])
                board[7][i] = Knight.new("black", self, [7,i])
            elsif i == 2 || i == 5
                board[0][i] = Bishop.new("white", self, [0,i])
                board[7][i] = Bishop.new("black", self, [7,i])
            elsif i == 3 
                board[0][i] = Queen.new("white", self, [0,i])
                board[7][i] = King.new("black", self, [7,i])
            else 
                board[0][i] = King.new("white", self, [0,i])
                board[7][i] = Queen.new("black", self, [7,i])
            end
        end

        board
    end

    def [](pos) # [8,9]
        x, y = pos # 8, 9
        if @board[x] == nil
            nil
        else
           return @board[x][y]
        end
    end

    def []=(pos, val)
        x, y = pos
        @board[x][y] = val
    end

    def move_piece(s_pos, e_pos) # [0,1] [2,2]
        if valid_pos?(s_pos,e_pos) 
            self[s_pos].pos = e_pos
            self[e_pos].pos = s_pos
            self[s_pos], self[e_pos] = self[e_pos],self[s_pos]
        end
        # going to refactor later when move captures come
    end

    def valid_pos?(start,end_l)
        if self[start].is_a?(NullPiece)
            raise "That is not a piece to move, its null"
        elsif (self[start] == nil) || (self[end_l] == nil) # self[8][9] == nil
            raise "Invalid board position, out of bounds cheater"
        end
        true
    end

    def render
        board.map do |row|
            row.map do |node|
                node.to_s
            end
        end.each do |row|
            puts row.join(" ")
        end
    end
    
    def add_piece(piece,pos)
        self[pos] = piece
    end
end

# OUR BOARD IS MESSED UP.... each thing is a whole instance of the board
b = Board.new
b.move_piece([0,3],[3,3])
b[[3,3]].moves
b.render
p b[[0,0]]
