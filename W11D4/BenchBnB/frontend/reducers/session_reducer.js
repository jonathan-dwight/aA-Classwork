import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session_actions"

const _nullSession = {
    id: null
}

export default (state = _nullSession, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state)
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            nextState["id"] = action.user.id
            return nextState
            // return Object.assign({}, state, {session: action.user.id})
        case LOGOUT_CURRENT_USER:
            return _nullSession;
        default:
            return state;
    }
}