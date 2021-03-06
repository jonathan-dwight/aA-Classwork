class UsersController < ApplicationController
    def new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user.id)
        else
            redirect_to new_user_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end


end
