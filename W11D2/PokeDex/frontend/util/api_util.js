

export const fetchAllPokemon = () => {
    return (
        $.ajax({
            url: `/api/pokemon`,
            method: `GET`
        })
    )
}
//grabbing all the data for our reducers

export const fetchSinglePokemon = (id) => {
    return (
        $.ajax({
            url: `/api/pokemon/${id}`,
            method: 'GET'
        })
    )
}


