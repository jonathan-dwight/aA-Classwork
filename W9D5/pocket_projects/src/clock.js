const htmlGenerator = require("./warmup.js")

const clockElement = document.getElementById("clock"); 

class Clock {
    constructor() {
        let date = new Date();
        this.hour = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();
    }

    printTime() {
        //add to the seconds, goes to 60.. grab remainder
        //add minutes with remainder
        //add hours with that remainder
        this.seconds += 1;
        this.minutes += Math.floor(this.seconds / 60);
        this.hours += Math.floor(this.minutes / 60);
        this.seconds %= 60;
        this.minutes %= 60;
        this.hours %= 24;

        return `${this.hours}:${this.minutes}:${this.seconds}`;
    }
}

const clock = new Clock();