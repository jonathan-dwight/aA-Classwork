class UsersController < ApplicationController

    def new
        # @user = User.new - use this for partials on how you writes the views
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to cats_url #right now just redirecting to cats index
        else  
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end

end
