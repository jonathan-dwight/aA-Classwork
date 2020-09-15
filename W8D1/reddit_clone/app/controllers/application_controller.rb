class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    #crlll

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_log_in!
        redirect_to new_session_url unless logged_in?
    end

    def login!(user)
        user.session_token = user.reset_session_token!
        session[:session_token] = user.session_token
    end
    
    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end
