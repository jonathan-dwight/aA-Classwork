import React from "react";
import { Link } from "react-router-dom";
import { Redirect } from "react-router-dom";

class SessionForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            name: "",
            password: "",
            email: ""
        }
        // this.updateName = this.updateName.bind(this);
        // this.updatePassword = this.updatePassword.bind(this);
        // this.updateEmail = this.updateEmail.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        // this.handleChange = this.handleChange.bind(this);
        //have to look into using handleChange???
        //NEED TO CHECK WHY AFTER CREATING A USER IT CANT'T LOG OUT   
    }


    handleInput(field) {
        return (e) => this.setState({ [field] : e.currentTarget.value})
    }
    // updateName(e) {
    //     this.setState({ name: e.target.value})
    // }

    // updatePassword(e) {
    //     this.setState({ password: e.target.value })
    // }

    // updateEmail(e) {
    //     this.setState({ email: e.target.value })
    // }

    handleSubmit(e) {
        e.preventDefault();
        let user = this.state;
        this.props.processForm(user).then(
            () => this.props.history.push("/")
        ).fail(() => this.props.history.push(`/${this.props.formType}`))
        //need to ask a question on how this is happening
        this.setState({
            name: "",
            password: "",
            email: ""
        });

    }
    //want to figure out when to use it... when session form unomunts.... also switching with sessionforums
    //componentdidUpdate
    //componentwillUnmount -
    //clear session_errors

    // componentDidUpdate() {
    //     return dispatch(this.props.clearForm())
    // }

    componentWillUnmount() {
        return dispatch(this.props.clearErrors())
    }

    render() {
        let errors = this.props.errors.map((el, idx) => {
            return <li key={idx}>{el}</li>
        })

        const emailInput = (this.props.formType === "login") ? null : (
            <label>Email:
                <input type="text" onChange={this.handleInput("email")} value={this.state.email} />
            </label>
        );

        const buttonLog = (this.props.formType === "login") ? (
                <Link to = "/signup" >
                    <button>Sign Up!</button>
                </Link >
        ) : (
                <Link to="/login" >
                    <button>Log In!</button>
                </Link >
        );

        let check;

        const header = (this.props.formType === "login") ? check = "Log In!" : check = "Sign Up!"

        return (
            <form onSubmit={this.handleSubmit}>
                
                {buttonLog}
                <h2>{header}</h2>
                <label>Username:
                    <input type="text" onChange={this.handleInput("name")} value={this.state.name} />
                </label>
                {emailInput}
                <label>Password:
                    <input type="password" onChange={this.handleInput("password")} value={this.state.password}/>
                </label>
                {errors}
                <input type="submit"/>
            </form>
        )
    }
}

export default SessionForm;