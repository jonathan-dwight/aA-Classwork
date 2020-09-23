/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("//Spacerock. It inherits from MovingObject\n\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Asteroid(options){\n    options[\"color\"] = \"#B22222\";\n    options[\"radius\"] = 25;\n    options[\"vel\"] = Util.randomVec(25)\n    MovingObject.call(this, options)\n    //Asteroid grabs proto of MovingObject\n}\nUtil.inherits(Asteroid, MovingObject)\n\n\n\nmodule.exports = Asteroid; \n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\n//Holds collections of the asteroids, bullets, and your ship.\n//Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.\n//Game.prototype.draw(ctx) draws the game.\n//Keeps track of dimensions of the space; wraps objects around when they drift off the screen.//\n\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst newAsteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game() {\n    this.DIM_X = 800;\n    this.DIM_Y = 800;\n    this.NUM_ASTEROIDS = 20;\n    this.asteroids = [];\n    this.addAsteroids()\n    //this.addAsteroids = \n}\n// Util.inherits(Game, MovingObject)\n\n// self.sss\nGame.prototype.addAsteroids = function () {\n    //this will return an array for this.asteroids\n    \n    // randomize positions in our DIM_X AND DIM_Y\n    //push positions into it within our dimensions\n    while (this.asteroids.length < this.NUM_ASTEROIDS) {\n        let x = Math.floor(Math.random() * 800);\n        let y = Math.floor(Math.random() * 800)\n        let newAstroid = new newAsteroid( {pos: [x,y]} )\n        this.asteroids.push(newAstroid);\n    }\n    \n}\n\nGame.prototype.draw = function (ctx){\n    //create asteroid instances and the draw it\n    for(let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx);\n        \n    }\n    clearRect(0, 0, this.DIM_X, this.DIM_Y)\n    // ctx.fillStyle = \"white\";\n    // ctx.fill();\n}\n\n\nGame.prototype.moveObjects = function() {\n    for (let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].move();\n    }\n}\n\nGame.prototype.wrap = function(pos) {\n return    \n}\n\n\nmodule.exports = Game; \n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Stores a Game instance.\n// Stores a canvas context to draw the game into.\n// Installs key listeners to move the ship and fire bullets.\n// Installs a timer to call Game.prototype.step.\n\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\")\n\nfunction GameView(ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n    // debugger\n    let that = this;\n    setInterval(function() { \n        that.game.moveObjects();\n        that.game.draw(ctx);\n    }, 20)\n  \n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const movingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = movingObject;\n\nconst asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = asteroid;\n\nconst utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nwindow.Utils = utils;\n\nconst game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = game;\n\nconst gameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nwindow.GameView = gameView;\n\ndocument.addEventListener(\"DOMContentLoaded\", () =>{\n    const gameCanvas = document.getElementById(\"game-canvas\");\n    const ctx = gameCanvas.getContext(\"2d\");\n    window.ctx = ctx;\n    gameCanvas.height = 800;\n    gameCanvas.width = 800;\n\n})\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("//Base class for anything that moves\n//Most important methods are MovingObject.prototype.move, \n//MovingObject.prototype.draw(ctx), \n//cMovingObject.prototype.isCollidedWith(otherMovingObject)\n\n\nfunction MovingObject(options) {\n  this.pos = options[\"pos\"];    \n  this.vel = options[\"vel\"];\n  this.radius = options[\"radius\"];\n  this.color = options[\"color\"];\n}\n\n\nMovingObject.prototype.move = function(){\n  let iPos = this.pos;\n  let x = iPos[0];\n  let y = iPos[1];\n  let newX = x + this.vel[0];\n  let newY = y + this.vel[1];\n  this.pos = [newX, newY];\n  return this.pos\n}\n\nMovingObject.prototype.draw = function (ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI );\n    ctx.stroke();\n    ctx.fill();\n}\n\n// const mo = new MovingObject({\n//     pos: [30, 30],\n//     vel: [10, 10],\n//     radius: 5,\n//     color: \"#00FF00\"\n// });\n\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("//Utility code, especially vector math stuff.\n//Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n//Norm([x_1, y_1]) = Dist([0, 0], [x_1, y_1])\n\nconst Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate() {}\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    // Function.prototype.inherits = function (ParentClass)\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });