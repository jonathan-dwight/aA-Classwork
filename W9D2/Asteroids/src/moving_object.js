//Base class for anything that moves
//Most important methods are MovingObject.prototype.move, 
//MovingObject.prototype.draw(ctx), 
//cMovingObject.prototype.isCollidedWith(otherMovingObject)


function MovingObject(options) {
  this.pos = options["pos"];    
  this.vel = options["vel"];
  this.radius = options["radius"];
  this.color = options["color"];
}


MovingObject.prototype.move = function(){
  let iPos = this.pos;
  let x = iPos[0];
  let y = iPos[1];
  let newX = x + this.vel[0];
  let newY = y + this.vel[1];
  this.pos = [newX, newY];
  return this.pos
}

MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI );
    ctx.stroke();
    ctx.fill();
}

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });




module.exports = MovingObject;