

Array.prototype.uniq = function(){
    let arr = [];
    for(let i = 0;i<this.length;i++){  
        if (!arr.includes(this[i])){
            arr.push(this[i]);
        }
    }
    return arr;
}

console.log([1, 2, 2, 3, 3, 3].uniq())


//returns array of positions... indices
//subarray of positions that equal to zero

Array.prototype.twoSum = function() {
    let arr = [];
    for (let i = 0; i < this.length; i++) {
        for (let i2 = 0; i2 < this.length; i2++) {
            if ((i2 > i) && (this[i] + this[i2] === 0)) {
                arr.push([i, i2]);
            }
        }
    }
    return arr;
}

//console.log([3, -2, 2, 1, -3].twoSum())


Array.prototype.transpose = function () {
    let arrTranspose = new Array([],[],[]);
    // debugger
    i = 0
    while (i < this.length) {
        for (let j = 0; j < this.length; j++){
            arrTranspose[i].push(this[j][i]);
        }
        i++;
    }
    return arrTranspose;

    // for (let i = 0; i < this.length; i++) {
    //     for (let i2 = 0; i2 < this.length; i2++) {

    //     }
    // }
}


// console.log([[0, 0, 0], [1, 1, 1], [2, 2, 2]].transpose())

// 0, 1, 2
// 0, 1, 2
// 0, 1, 2

