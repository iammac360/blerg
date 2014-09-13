class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.build_from(@post , current_user.id, params[:comment])
    @comment.save

    respond_to do |format|
      format.js {}
    end
  end
end
