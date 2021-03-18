class IdeasController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
before_action :set_idea, only: [:show, :destroy, :edit, :update]
before_action :check_user, except: [:index, :show, :create]

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
    @comment = Comment.new
    @comments = @idea.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @idea.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  private
  def idea_params
    params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def check_user
    if current_user.id != @idea.user_id
      redirect_to root_path
    end
  end
end
