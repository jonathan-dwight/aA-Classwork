class UsersController < ApplicationController
    # before_action :require_logged_on, only[:destroy] #placeholder 

    def new
        render :new 
    end

    def show
        debugger
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages #create in the application views to display errors
            render :new
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
