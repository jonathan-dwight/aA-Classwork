const DomNodeCollection = require("./dom_node_collection");

window.$l = (arg) => {
    if (typeof arg === 'string') {
        return getNodes(arg);
        window.$l = $l;
    }
}

// const NodeCollection = __webpack_require__(1);

getNodes = selector => {
    const nodes = document.querySelectorAll(selector);
    const nodes_array = Array.from(nodes);
    return new NodeCollection(nodes_array);
};