//Utility code, especially vector math stuff.
//Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
//Norm([x_1, y_1]) = Dist([0, 0], [x_1, y_1])

const Util = {
    inherits(childClass, parentClass) {
        function Surrogate() {}
        Surrogate.prototype = parentClass.prototype;
        childClass.prototype = new Surrogate();
        childClass.prototype.constructor = childClass;
    // Function.prototype.inherits = function (ParentClass)
    },
    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    // Scale the length of a vector by the given amount.
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
};

module.exports = Util;
