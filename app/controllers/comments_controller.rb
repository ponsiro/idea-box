class CommentsController < ApplicationController

  def create
   if comment = Comment.create(comment_params)
     redirect_to "/ideas/#{comment.idea.id}"
   else
    render "ideas/#{@comment.idea.id}"
    
   end
  end

  def destroy
    comment = Comment.find(params[:idea_id])
    comment.destroy
    redirect_to "/ideas/#{comment.idea.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end
end
