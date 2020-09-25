const FollowToggle = require("./follow_toggle")

$(() => {
    let $toggleEls = $(".follow-toggle")
    $toggleEls.each ((idx, el) => {
        return new FollowToggle($(el))
    })

})