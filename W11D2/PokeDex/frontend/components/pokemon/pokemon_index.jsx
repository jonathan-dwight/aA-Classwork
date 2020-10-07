import React from "react"
import PokemonDetail from "./pokemon_detail"
import { HashRouter, Route } from "react-router-dom";
import pokemon_index_container from "./pokemon_index_container";
import PokemonIndexItem from "./pokemon_index_item"

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            fetching: true
        }
    }

    componentDidMount() {
        this.props.requestAllPokemon().then(() => {
            this.setState({fetching: false})
        })
    }

    render() {
        
        if (this.state.fetching) {
            return (<div>loading</div>)
        }

        const pokemonItems = this.props.pokemon.map((el) => {
            return <PokemonIndexItem key={el.id} pokemon={el}/>
        })
        
        return (
            <>
                <section className="pokedex">
                    <Route path="/pokemon/:id" component={PokemonDetail}/>
                    <ul>{pokemonItems}</ul>
                </section>
            </>
        )
    }
}

export default PokemonIndex