import React from "react"
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        return(
            <> 
                <Link to={`/pokemon/${this.props.pokemon.id}`}>
                    <h3>{this.props.pokemon.name}</h3>
                    <img src={this.props.pokemon.image_url}/>
                </Link>
            </>
        )
    }
}

export default PokemonIndexItem