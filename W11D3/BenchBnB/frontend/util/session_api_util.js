export const postUser = (user) => {
    return $.ajax ({
        url: '/api/users',
        method: 'POST'
    })
}

export const postSession = (user) => {
    return $.ajax({
        url: '/api/session',
        method: 'POST'
    })
}

export const deleteSession = () => {
    return $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
}