import React from "react";

function uniqueId() {
    return new Date().getTime();
}

class TodoForm extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            id: uniqueId(),
            title: "",
            body: "", 
            done: ""
        }
        this.updateTitle = this.updateTitle.bind(this)
        this.updateBody = this.updateBody.bind(this)
        this.updateDone = this.updateDone.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    updateTitle(e){
        this.setState({ title: e.target.value })
    }

    updateBody(e){
        this.setState({ body: e.target.value })
    }

    updateDone(e){
        this.setState({ done: e.target.value })
    }

    handleSubmit(){
        event.preventDefault();
        const todo = this.state
        this.props.receiveTodo(todo)
        this.setState({
            id: uniqueId(),
            title: "",
            body: "",
            done: ""
        })
    }

    render(){
        
    }

}

export default TodoForm;