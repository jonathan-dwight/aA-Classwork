//this is going to combine our reducers into one, to keep it Dry

import { combineReducers } from "redux";
import  pokemonReducer from "./pokemon_reducer";
import itemReducer from "./item_reducer"

const entitiesReducer = combineReducers({
    pokemon: pokemonReducer,
    item: itemReducer
})

export default entitiesReducer;