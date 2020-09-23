// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.

const Game = require("./game")

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function(){
    // debugger
    let that = this;
    setInterval(function() { 
        that.game.moveObjects();
        that.game.draw(ctx);
    }, 20)
  
}

module.exports = GameView;