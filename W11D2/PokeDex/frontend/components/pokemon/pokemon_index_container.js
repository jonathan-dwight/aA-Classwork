import { connect } from 'react-redux';
import PokemonIndex from "./pokemon_index"
import { selectAllPokemon } from "../../reducers/selectors"
import { requestAllPokemon } from "../../actions/pokemon_actions"

const mapStateToProps = (state) => {
    let pokemon = selectAllPokemon(state);
    return ({pokemon: pokemon})
}

const mapDispatchToProps = (dispatch) => {
    return ({
        requestAllPokemon: () => {
            return dispatch(requestAllPokemon())
        }
    })
}

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex)