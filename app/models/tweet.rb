class Tweet < ApplicationRecord
  #追加 User用
  belongs_to :user
  #追加 Favorite用
  has_many :favorites
  #追加 Commentテーブル用
  has_many :comments

  #ユーザーがツイートをお気に入りしたかどうかの判定メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #ツイートにコメントがついているかの判定メソッド
  def comment_by?(user)
    comment.where(user_id: user.id).exists?
  end

end
