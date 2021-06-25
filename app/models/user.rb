class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 画像保存のためImageとの関連付を行う
  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #追加 Tweetテーブル用
  has_many :tweets
  #追加 Favoriteテーブル用
  has_many :favorites
  #追加 ユーザーがお気に入りしたツイート取得用
  has_many :favorite_tweets, through: :favorites, source: :tweet
  #追加 Commentテーブル用  User.commentで、ユーザーのコメントを取得できる
  has_many :comments

  #フォローしているユーザーとの関連
  has_many :active_relationships,class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  #フォローされるユーザーとの関連
  has_many :passive_relationships,class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
  # 現在自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  # 既にフォロー済みか？
  passive_relationships.find_by(following_id: user.id).present?
  end
end
