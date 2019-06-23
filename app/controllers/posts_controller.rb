class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user,only:[:destroy]
  
  
  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      flash[:success]='投稿しました'
      redirect_to posts_path
    else
      @posts=current_user.feed_posts.order(id: :desc).page(params[:id])
      flash.now[:danger]='投稿に失敗しました'
      render 'toppages/index'
    end
      
    
  end

  def show
    
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params[:id])
  end

  def index
    if logged_in?
     @posts=current_user.feed_posts.order(id: :desc).page(params[:page])
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to current_user
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:content,:author,:image)
  end
  
  def correct_user
    @post= current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_path
    end
  end
end
