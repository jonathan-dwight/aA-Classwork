import { connect } from "react-redux";
import BenchIndex from "./bench_index";
import { fetchBenches } from "../../actions/benches_action";


const mapStateToProps = (state) => {
    let benches = Object.values(state.entities.benches)
    return ({
        benches: benches
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        fetchBenches: () => dispatch(fetchBenches()),
    })

}

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex)