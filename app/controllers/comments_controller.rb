class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html { redirect_to user_post_path(params[:user_id], params[:post_id]) }
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.create(author_id: current_user.id, post_id: params[:post_id], text: params[:comment][:text])
    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
        end
        format.json do
          render json: { status: 'Success', message: 'Comment was successfully created', data: @comments }, status: :created
        end
      end

    else
      format.html { render :new }
      format.json do
        render json: { status: 'error', message: 'Failted to create new comment' }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    if @comment.destroy
      flash[:success] = 'Comment successful deleted'
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      flash[:error] = 'Failed to delete comment'
      redirect_to @comment.post
    end
  end
end
