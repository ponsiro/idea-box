class LikesController < ApplicationController
  before_action :authenticate_user!
  

  def create
    Like.create(user_id: current_user.id, idea_id: params[:id])
    redirect_to root_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, idea_id: params[:id]).destroy
    redirect_to root_path
  end

  
end
