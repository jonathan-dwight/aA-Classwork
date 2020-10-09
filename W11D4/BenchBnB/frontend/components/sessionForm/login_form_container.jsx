import { connect } from "react-redux";
import SessionForm from "./session_form"
import { login } from "../../actions/session_actions";

//ownProps will come from when we set up the route
const mapStateToProps = (state, ownProps) => {
    let errors = state.errors.session

    return ({
        'errors': errors,
        'formType': 'login'
        //need to fill out with your 
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        processForm: (form) => dispatch(login(form))
    })
}

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)