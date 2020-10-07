//entry file
import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root"
import { HashRouter, Route } from "react-router-dom";
import { receiveAllPokemon, requestAllPokemon, receiveSinglePokemon, requestSinglePokemon } from "./actions/pokemon_actions"
import { fetchAllPokemon, fetchSinglePokemon } from "./util/api_util"
import { selectAllPokemon } from "./reducers/selectors"


import configureStore from "./store/store";

document.addEventListener("DOMContentLoaded", () => {
    const RootEl = document.getElementById('root');
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, RootEl)

   window.receiveAllPokemon = receiveAllPokemon;
   window.fetchAllPokemon = fetchAllPokemon;
   window.getState = store.getState;
   window.dispatch = store.dispatch;
   window.requestAllPokemon = requestAllPokemon;
   window.selectAllPokemon = selectAllPokemon;
   window.fetchSinglePokemon = fetchSinglePokemon;
   window.receiveSinglePokemon = receiveSinglePokemon;
   window.requestSinglePokemon = requestSinglePokemon;
})