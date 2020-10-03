import React from "react";
import TodoListItem from "./todo_list_item"

class TodoList extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        // debugger
        const todoList = this.props.todos.map((el, idx) => {
            return <TodoListItem todo={el} key={idx}/>;
        })

        return(
            <> 
                <ul>
                    {todoList}
                    <TodoForm receiveTodo={this.props.receiveTodo} />
                </ul>
            </>
        )
    }
}
// const TodoList = () => <h3>Todo List goes here!</h3>

export default TodoList

