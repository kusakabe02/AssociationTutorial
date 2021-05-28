Rails.application.routes.draw do

  # get 'relationships/create'
  #
  # get 'relationships/destroy'

  get 'comments/index'

  get 'comments/create'

  get 'comments/destroy'

  # get 'comment/index'
  #
  # get 'comment/show'
  #
  # get 'comment/create'
  #
  # get 'comment/destroy'

# 不要なのでコメントアウト
#   get 'favorites/create'
#   get 'favorites/destroy'

# 2021/05/25 課題 ルーティング追加
  root 'tweets#index'
  devise_for :users

# 追加、ネストしたルーティング記述 resources と書くことで、７つのアクションへのルーティングになる。可能なアクションを絞りたい時に onlyを用いる
  resources :tweets do
    resource :favorites, only:[:create, :destroy]
    resources :comments,  only:[:new, :create, :destroy]
  end

  resources :users do
    resource :relationships, only:[:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member
  end

  # get 'tweets/new'
  #
  # get 'tweets/index'
  #
  # get 'tweets/show'
  #
  # get 'tweets/create'
  #
  # get 'users/index'
  #
  # get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
