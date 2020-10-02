export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";


// export const receiveShirt = (shirt) => { // function where we are creating actions
//     return {
//         type: RECEIVE_SHIRT,
//         // shirt: shirt // perfectly fine BUT...
//         shirt // dis line, line 20, does ^ short hand notation
//     }
// }

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos
    }
}

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo
    }
}