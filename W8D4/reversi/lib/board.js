let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8)
  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }
  
  const lightPiece = new Piece("white");
  const darkPiece = new Piece("black");
  
  grid[3][4] = darkPiece;
  grid[4][3] = darkPiece;
  grid[3][3] = lightPiece;
  grid[4][4] = lightPiece;

  return grid

}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x < 0 || x > 7) {
    return false;
  } else if (y < 0 || y > 7) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (!this.isValidPos(pos)) {
    throw new Error("Not a valid pos!");
  } else {
    return this.grid[x][y];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let x = pos[0];
  let y = pos[1];
  let current_color = color
 
  if (this.grid[x][y] === undefined) {
    return undefined;
  } else if (this.grid[x][y].color === current_color) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let x = pos[0];
  let y = pos[1];

  return (this.grid[x][y] === undefined) ? false : true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip = []) {
  let x = pos[0];
  let y = pos[1];
  let newx = x + dir[0];
  let newy = y + dir[1];
  pos = [newx, newy];

  //
  if (!this.isValidPos(pos) || this.grid[pos[0]][pos[1]] === undefined)  {
    return [];
  }
  
  if (this.grid[pos[0]][[pos[1]]].color === color) {
    return piecesToFlip;
  }

  piecesToFlip.push(pos)
  return this._positionsToFlip(pos, color, dir, piecesToFlip)
  

  // base case is when you hit your own color.

};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false
    //we have the Board.DIRS positions we can use to call into the method above
  }

  for (let i = 0; i < Board.DIRS.length; i++) {
    const piecesToFlip = this._positionsToFlip(pos, color, Board.DIRS[i])
    if (piecesToFlip.length > 0) {
      return true; 
    }
  }
  return false;
};




/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Not a valid move!");
  }
  let positionsToFlip = [];
  
  for (let i = 0; i < Board.DIRS.length; i++) {
    positionsToFlip = positionsToFlip.concat(this._positionsToFlip(pos, color, Board.DIRS[i]));;
  };
  
  for (let j = 0; j < positionsToFlip.length; j++) {
    this.getPiece(positionsToFlip[j]).flip();
  }
  //setting the position to the color since we flip
  this.grid[pos[0]][pos[1]] = new Piece(color);
};



/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const validMovesList = [];

  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i, j], color)){
        validMovesList.push([i, j]);
      }
    }
  }
  return validMovesList;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("black") && !this.hasMove("white");
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
