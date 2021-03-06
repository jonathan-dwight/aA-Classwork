import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root"
import { signup, login, logout } from "./actions/session_actions"
import { fetchBenches } from "./actions/benches_action"
import configureStore from "./store/store"

document.addEventListener("DOMContentLoaded", () => {
    
    let store;
    if (window.currentUser) {
        const preloadedState = {
            entities: {
                users: { [window.currentUser.id]: window.currentUser }
            },
            session: { id: window.currentUser.id}
        }  
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store}/>, root);

    //testing functions
    window.signup = signup;
    window.login = login;
    window.logout = logout;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.fetchBenches = fetchBenches
});

let user1 = {name: "JD", email: "jd@aa.io", password: "password"}

//PROBLEM 1 - NEED TO CHECK THE WHY SIGN UP IS NOT ALLOWING ME TO LOGOUT