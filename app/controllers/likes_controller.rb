class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :idea_params
  

  def create
    Like.create(user_id: current_user.id, idea_id: params[:idea_id])
    
  end

  def destroy
    Like.find_by(user_id: current_user.id, idea_id: params[:idea_id]).destroy
    
  end

  private
  
  def idea_params
    @idea = Idea.find(params[:idea_id])
  end
  
end
