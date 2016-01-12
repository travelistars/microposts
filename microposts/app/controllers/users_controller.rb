I18n.locale = "ja"
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following_users, :follower_users]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample app!"
      redirect_to @user
    else
      render 'new'
    end
    
    def following_users
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.following_users.paginate(page: params[:page])
      render 'show_follow'
    end
    
    def follower_users
      @title = "Followers"
      @user  = User.find(params[:id])
      @users = @user.follower_users.paginate(page: params[:page])
      render 'show_follow'
    end
    
end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
    
  
end