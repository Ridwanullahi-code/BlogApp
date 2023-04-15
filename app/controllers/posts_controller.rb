class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(author_id: params[:post][:user_id], title: params[:post][:title], text: params[:post][:text].gsub(/\r\n?/, '<br>'))

    if @post.save
      redirect_to user_path(params[:post][:user_id]), notice: 'Post was successfully created.'
    else
      render :new
      flash.alert = 'Error!, Post not added!'
    end
  end
end