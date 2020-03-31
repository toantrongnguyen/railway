class CommentsController < ApplicationController
  def create
    comment = CommentService.create(params, current_user.id)
    redirect_to movie_path(params[:movie_id])
  end
end
