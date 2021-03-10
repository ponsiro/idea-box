class IdeasController < ApplicationController
before_action :authenticate_user!, only: [:create]

  def index
    @ideas = Idea.all.order(created_at: "desc")
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to root_path
  end

  private
  def idea_params
    params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end
end
