class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
  end
  #フォローのコントローラー実装
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  #画像保存するために追加
  def update
      @user = User.find(params[:id])
      @user.update(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def user_params
      params.require(:user).permit(:image)
  end

end
