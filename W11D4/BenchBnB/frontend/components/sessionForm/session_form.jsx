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
        this.updateName = this.updateName.bind(this);
        this.updatePassword = this.updatePassword.bind(this);
        this.updateEmail = this.updateEmail.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        // this.handleChange = this.handleChange.bind(this);
        //have to look into using handleChange???
        //NEED TO CHECK WHY AFTER CREATING A USER IT CANT'T LOG OUT   
    }

    updateName(e) {
        this.setState({ name: e.target.value})
    }

    updatePassword(e) {
        this.setState({ password: e.target.value })
    }

    updateEmail(e) {
        this.setState({ email: e.target.value })
    }

    handleSubmit(e) {
        e.preventDefault();
        let user = this.state;
        this.props.processForm(user).then(
            this.props.history.push("/")
        )
        this.setState({
            name: "",
            password: "",
            email: ""
        });

    }

    render() {
        let errors = this.props.errors.map((el, idx) => {
            return <li key={idx}>{el}</li>
        })

        const emailInput = (this.props.formType === "login") ? null : (
            <label>Email:
                <input type="text" onChange={this.updateEmail} value={this.state.email} />
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
                    <input type="text" onChange={this.updateName} value={this.state.name} />
                </label>
                {emailInput}
                <label>Password:
                    <input type="password" onChange={this.updatePassword} value={this.state.password}/>
                </label>
                {errors}
                <input type="submit"/>
            </form>
        )
    }
}

export default SessionForm;