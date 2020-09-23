const Asteroid = require("./asteroid");
const MovingObject = require("./moving_object");
//Holds collections of the asteroids, bullets, and your ship.
//Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
//Game.prototype.draw(ctx) draws the game.
//Keeps track of dimensions of the space; wraps objects around when they drift off the screen.//

const Util = require("./utils");
const newAsteroid = require("./asteroid");

function Game() {
    this.DIM_X = 800;
    this.DIM_Y = 800;
    this.NUM_ASTEROIDS = 20;
    this.asteroids = [];
    this.addAsteroids()
    //this.addAsteroids = 
}
// Util.inherits(Game, MovingObject)

// self.sss
Game.prototype.addAsteroids = function () {
    //this will return an array for this.asteroids
    
    // randomize positions in our DIM_X AND DIM_Y
    //push positions into it within our dimensions
    while (this.asteroids.length < this.NUM_ASTEROIDS) {
        let x = Math.floor(Math.random() * 800);
        let y = Math.floor(Math.random() * 800)
        let newAstroid = new newAsteroid( {pos: [x,y]} )
        this.asteroids.push(newAstroid);
    }
    
}

Game.prototype.draw = function (ctx){
    //create asteroid instances and the draw it
    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx);
        
    }
    clearRect(0, 0, this.DIM_X, this.DIM_Y)
    // ctx.fillStyle = "white";
    // ctx.fill();
}


Game.prototype.moveObjects = function() {
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
}

Game.prototype.wrap = function(pos) {
 return    
}


module.exports = Game; 