export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON"

import * as APIUtil from "../util/api_util"

export const receiveAllPokemon = (pokemon) => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon: pokemon
    }
}

export const receiveSinglePokemon = (payload) => {
    return {
        type: RECEIVE_SINGLE_POKEMON,
        payload
    }
}

export const requestSinglePokemon = (id) => dispatch => {
    return APIUtil.fetchSinglePokemon(id)
        .then(response => dispatch(receiveSinglePokemon(response)))
}

//thunk action creator

export const requestAllPokemon = () =>  dispatch => {
    return APIUtil.fetchAllPokemon()
    .then(response => dispatch(receiveAllPokemon(response)))
}
