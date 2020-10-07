import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';


const itemReducer = (state = {}, action) => { //action is what we get from our database
    Object.freeze(state);
    let nextState = Object.assign({}, state)
    switch (action.type) {
        case RECEIVE_SINGLE_POKEMON:
            nextState["items"] = action.payload.items
            return nextState
        default:
            return state;
    }
}

export default itemReducer