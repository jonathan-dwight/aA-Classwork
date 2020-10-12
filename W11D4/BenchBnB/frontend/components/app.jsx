import React from "react";
import GreetingContainer from "./greetings/greeting_container"
import LoginFormContainer from "./sessionForm/login_form_container"
import SignupFormContainer from "./sessionForm/signup_form_container"
import SearchContainer from "./benches/search_container"
import { AuthRoute } from ".././util/route_util"
import { Route } from "react-router-dom";

const App = () => {
    return (
        <div>
            <header>
                <h1>Bench Bnb</h1>
                <Route exact path="/" component={GreetingContainer} />
            </header>
    
            <AuthRoute exact path="/login" component={LoginFormContainer} />
            <AuthRoute exact path="/signup" component={SignupFormContainer} />
            <Route exact path="/" component={SearchContainer} />
        </div>

    )
}

export default App;