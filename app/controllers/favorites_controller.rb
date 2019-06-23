class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    post=Post.find(params[:post_id])
    current_user.like(post)
    flash[:success]= "お気に入りに登録しました"
    redirect_to likes_user_path(current_user)
  end
  

  def destroy
    post=Post.find(params[:post_id])
    current_user.unlike(post)
    flash[:success] = "お気に入りから削除しました"
    redirect_to likes_user_path(current_user)
  end
end
