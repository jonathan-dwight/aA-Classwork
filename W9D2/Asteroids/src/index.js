const movingObject = require("./moving_object.js");
window.MovingObject = movingObject;

const asteroid = require("./asteroid.js");
window.Asteroid = asteroid;

const utils = require("./utils.js");
window.Utils = utils;

const game = require("./game.js");
window.Game = game;

const gameView = require("./game_view");
window.GameView = gameView;

document.addEventListener("DOMContentLoaded", () =>{
    const gameCanvas = document.getElementById("game-canvas");
    const ctx = gameCanvas.getContext("2d");
    window.ctx = ctx;
    gameCanvas.height = 800;
    gameCanvas.width = 800;

})