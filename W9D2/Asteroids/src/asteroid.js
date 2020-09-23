//Spacerock. It inherits from MovingObject

const MovingObject = require("./moving_object");
const Util = require("./utils");

function Asteroid(options){
    options["color"] = "#B22222";
    options["radius"] = 25;
    options["vel"] = Util.randomVec(25)
    MovingObject.call(this, options)
    //Asteroid grabs proto of MovingObject
}
Util.inherits(Asteroid, MovingObject)



module.exports = Asteroid; 