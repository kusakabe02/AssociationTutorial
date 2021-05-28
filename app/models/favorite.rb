class Favorite < ApplicationRecord
  #中間テーブルでのモデルの記述
  belongs_to :user
  belongs_to :tweet
end
