class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])
    @comment = Comment.create(author_id: current_user.id, post:, text: params[:comment][:text])
    if @comment.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
