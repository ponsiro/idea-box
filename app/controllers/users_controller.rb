class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :check_user, only: [:edit, :update]

  def show
    @ideas = @user.ideas.order(created_at: "desc")
  end

  def edit
    @icon = @user.icon
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :encrypted_password, :email, :icon, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
