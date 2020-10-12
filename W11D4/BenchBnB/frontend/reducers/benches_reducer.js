import { RECEIVE_BENCHES } from "../actions/benches_action"

const benchesReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);

    switch(action.type) {
        case RECEIVE_BENCHES:
            nextState = action.benches;
            return nextState;
        default:
            return state;
    }
}

export default benchesReducer;