class IdeasController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]

  def index
    @ideas = Idea.all.order(created_at: "desc")
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @comments = @idea.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to root_path
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def idea_params
    params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end
end
