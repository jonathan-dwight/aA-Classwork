import React from "react"


const allTodos = (state) => {
    // debugger
    return (Object.keys(state.todos).map((id) => {return (state.todos[id])}))
}

export default allTodos;