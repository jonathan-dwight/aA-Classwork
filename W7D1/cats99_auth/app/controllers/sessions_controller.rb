class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        # find the user by username/password - no user.. render :new
        # reset the usertoken
        # update the session
        # instance variables are mainly for views 
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        if user
            session[:session_hash] = user.reset_session_token!
            redirect_to cats_url
        else  
            render :new
        end
    end

    def destroy
        current_user.reset_session_token! if current_user
        session[:session_hash] = nil
    end

end
