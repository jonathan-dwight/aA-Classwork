class Api::SessionsController < ApplicationController
    # before_action :require_logged_in!, only [:destroy]

    def create
        @user = User.find_by_credentials(
            params[:user][:name],
            params[:user][:password]
        )

        if @user
            login!(@user)
            render :show
        else
            render json: @user.errors.full_messages, status 422
            # we dont need to redirect anymore because we are just sending back json
            # for the front end
        end
    end

    def destroy
        if current_user 
            logout!
            render json: {}
        else  
            render json: ["Current User not logged in?"], status 404
            # leave in bracket because we would potentially iterate over errors
        end
    end

end
