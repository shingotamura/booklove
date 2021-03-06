class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index,:show,:likes]
  
  def index
    @users=User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to login_path
    else
      flash.now[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end
  
  def posts
    @user=User.find(params[:id])
    @posts=@user.posts.page(params[:page])
  end 
  
  def likes
    @user=User.find(params[:id])
    @likes=@user.likes.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :kind, :password, :password_confirmation)
  end
end
