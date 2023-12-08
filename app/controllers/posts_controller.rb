class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        @posts = Post.all
        flash[:alert] = @post.errors.count
        format.html { render :index, alert: 'Post was not created.' }
      end
    end
  end

  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @users = User.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
