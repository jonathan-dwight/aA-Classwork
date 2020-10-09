import { connect } from "react-redux";
import SessionForm from "./session_form"
import { signup } from "../../actions/session_actions";

//ownProps will come from when we set up the route
const mapStateToProps = (state, ownProps) => {
    let errors = state.errors.session

    return ({
        'errors': errors,
        'formType': 'signup'
        //need to fill out with your 
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        processForm: (form) => dispatch(signup(form))
    })
}

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)