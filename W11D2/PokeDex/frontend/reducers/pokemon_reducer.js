import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions'; //so we don't mispell



const pokemonReducer = (state = {}, action) => { //action is what we get from our database
    Object.freeze(state);
    let nextState = Object.assign({}, state)
    switch (action.type) {
        case RECEIVE_ALL_POKEMON: 
            nextState = action.pokemon;
            return nextState;
        case RECEIVE_SINGLE_POKEMON:
            nextState[action.payload.pokemon.id] = action.payload.pokemon
            return nextState
        default:
           return state;
    }
}

export default pokemonReducer