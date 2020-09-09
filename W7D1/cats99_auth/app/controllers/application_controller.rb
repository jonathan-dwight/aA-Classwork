class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        User.find_by({session_token: session[:session_token]})
        # can do either way for passing in session token? or looking in session hash
        # for the session_tokens that are active
    end

    


end
