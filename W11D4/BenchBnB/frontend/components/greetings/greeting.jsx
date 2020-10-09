import React from "react";
import { Link } from "react-router-dom";

class Greeting extends React.Component {
    constructor(props) {
        super(props)
        // this.state = {
        //     login: false
        // }
        this.handleClick = this.handleClick.bind(this)
    }

    handleClick() {
        this.props.logout()
    }

    render() {
        if (this.props.user) {
            return (
                <>
                    <h2>Welcome Back!! {this.props.user.name}</h2>
                    <button onClick={this.handleClick}>Logout</button>
                </>
            )
        } else {
            return (
                <>
                    <Link to={`/signup`}>
                        <button>Sign Up</button>
                    </Link>
                    <Link to={`/login`}>
                        <button>Login</button>
                    </Link>
                </>
            )
        }
    }
}

export default Greeting