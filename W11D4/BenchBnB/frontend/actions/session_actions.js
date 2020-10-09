import * as SessionAPI from "../util/session_api_util"

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER"
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_ERRORS = "RECEIVE_ERRORS"
export const CLEAR_SESSION_ERRORS = "CLEAR_SESSION_ERRORS"

export const receiveCurrentUser = (user) => ({
    type: RECEIVE_CURRENT_USER,
    user
})

export const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
})

export const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    errors
})

export const clearSessionErrors = () => ({
    type: CLEAR_SESSION_ERRORS,
})


//thunk action creators

export const login = (user) => (dispatch) => {
    return SessionAPI.login(user).then((resp) => {
        dispatch(receiveCurrentUser(resp))
    }).fail((resp) => {
        dispatch(receiveErrors(resp.responseJSON))
    }) 
}

export const logout = () => (dispatch) => {
    return SessionAPI.logout().then((resp) => {
       dispatch(logoutCurrentUser(resp))
    })
}

export const signup = (user) => (dispatch) => {
    return SessionAPI.signup(user).then((resp) => {
        dispatch(receiveCurrentUser(resp))
    }).fail((resp) => {
            dispatch(receiveErrors(resp.responseJSON))
    }) 
        //should ask if i need to return a dispatch
}

//clear errors!

export const clearErrors = () => (dispatch) => {
    return dispatch(clearSessionErrors())
}

