// arr = [1,2,3]
// arr.each {|ele| ele * 2}

Array.prototype.myEach = function (cb){
    let i = 0;
    while (i < this.length){
        cb(this[i]);
        i++;
    }
}

const double = function(num){
    return num * 2;
}

//console.log([1,2,3,4,5].myEach(double))



Array.prototype.myMap = function (cb) {
    let arr = [];

    this.myEach(function(el) {
        arr.push(cb(el));
    })

    return arr;
}


console.log([1,2,3,4,5].myMap(double))



