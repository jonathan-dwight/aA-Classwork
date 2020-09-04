class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    # debugger
    user = User.new(user_params)
    # require - takes in the model name
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to user_url(user.id)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
