import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import {receiveTodos, receiveTodo} from './frontend/actions/todo_action';
import Root from "./frontend/components/root";
import allTodos from "./frontend/reducers/selectors"


document.addEventListener("DOMContentLoaded", () => {
    const content = document.getElementById("content");
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, content)
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.allTodos = allTodos;
})

