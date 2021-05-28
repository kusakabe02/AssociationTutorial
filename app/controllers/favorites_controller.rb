class FavoritesController < ApplicationController
  def create
    #お気に入り登録ボタンを押したときに呼び出される、押したUserのidと押されたTweetのidでFavoritesテーブルにインスタンスを作成
    favorite = current_user.favorites.build(tweet_id: params[:tweet_id])
    favorite.save
    redirect_to tweets_path
  end

  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id],user_id: current_user.id)
    favorite.destroy
    redirect_to tweets_path
  end
end
