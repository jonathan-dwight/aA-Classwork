import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER, CLEAR_SESSION_ERRORS} from "../actions/session_actions"


export default (state = [], action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            return []
        case RECEIVE_ERRORS:
            return action.errors
            //return the array of errors
        case CLEAR_SESSION_ERRORS:
            return []
        default:
            return state;
    }
}