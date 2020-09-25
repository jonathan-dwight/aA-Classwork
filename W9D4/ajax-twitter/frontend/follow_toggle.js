class FollowToggle {

    constructor(el){
        this.$el = el
        this.userId = this.$el.data("user-id")
        this.followState = this.$el.data("initial-follow-state")
        this.render()
        this.$el.on("click", (event) => {
            event.preventDefault();
            this.handleClick.call(this)
        })

    }

    render(){
        if (this.followState === "unfollowed"){
            this.$el.text("Follow")
        } else {
            this.$el.text("Unfollow!")
        }
    }

    handleClick() {
        let that = this;
        let methodType = "";
        if (this.followState === "followed"){
            methodType = "delete"
            that.followState = "unfollowed"
        } else {
            methodType = "post"
            that.followState = "followed"
        }

        return $.ajax({
            method: `${methodType}`,
            url: `/users/${this.userId}/follow`,
            dataType: "json",
            success: function () {
                that.render()
            }
        })
    }

}

module.exports = FollowToggle;
