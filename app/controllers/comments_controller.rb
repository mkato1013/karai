class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @food = Food.find(params[:food_id])
    @comment = Comment.create(comment_params)
    @comments = @food.comments.order("created_at DESC")
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id ,food_id: params[:food_id])
  end
end
