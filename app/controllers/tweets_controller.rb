class TweetsController < ApplicationController
  #deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  before_action :authenticate_user!, except: [:index]
  def new
    #新規投稿用の空インスタンス
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    #ログイン中のユーザーのツイートを取得
    @user = @tweet.user
    @comment = current_user.comments.build
    @comments = @tweet.comments
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
