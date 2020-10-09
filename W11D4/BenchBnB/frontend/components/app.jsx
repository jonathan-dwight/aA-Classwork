import React from "react";
import GreetingContainer from "./greetings/greeting_container"
import LoginFormContainer from "./sessionForm/login_form_container"
import SignupFormContainer from "./sessionForm/signup_form_container"
import { Route } from "react-router-dom";

const App = () => {
    return (
        <div>
            <header>
                <h1>Bench Bnb</h1>
                <GreetingContainer />
            </header>
    
            <Route path="/login" component={LoginFormContainer} />
            <Route path="/signup" component={SignupFormContainer} />
        </div>

    )
}

export default App;