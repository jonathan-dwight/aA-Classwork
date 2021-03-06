import { RECEIVE_TODO } from "../actions/todo_action";
import { RECEIVE_TODOS } from "../actions/todo_action";


const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state); //does not modify
    const nextState = Object.assign({}, state); //makes copy of state

    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.map((todo) => {
                nextState[todo.id] = todo
            })
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo
            return nextState
        default:
            return state;
    }
};

export default todosReducer;



