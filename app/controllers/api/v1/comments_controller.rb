class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @comments = Comment.all.where(author_id: params[:user_id], post_id: params[:post_id])
    render json: @comments
  end

  def create
    request_body = JSON.parse(request.body.read)
    comment = Comment.new(author_id: current_user, post_id: params.require(:post_id), text: request_body['comment'])

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_body
    params.require(:comment).permit(:text)
  end
end
