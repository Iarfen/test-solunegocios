class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.create!(user_params)
    render json: @user, status: 200
  end

  def show
    if (User.exists?(params[:id]))
        @user = User.find(params[:id])
        render json: @user, status: 200
    else
        render json: nil, status: 200
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:email)
  end
end
