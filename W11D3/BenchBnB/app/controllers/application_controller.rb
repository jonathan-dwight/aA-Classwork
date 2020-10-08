class ApplicationController < ActionController::Base

    #crlll
    def current_user
        @current_user ||= User.find_by_credentials(session_token: session[:session_token])
    end

    def login!(user)
        user.session_token = user.reset_session_token!
        session[:session_token] = user.session_token
    end

    def logged_in?
        !!current_user
    end

    def logout!
        @current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in
        redirect_to api_session_url unless logged_in?
    end

end
