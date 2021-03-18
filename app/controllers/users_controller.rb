class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.order(created_at: "desc")
  end
end
