Rails.application.routes.draw do
  devise_for :users 
  
  root to: 'items#index'

  resources :items

  # patch 'items/:id' => 'items#update', as: 'item'
  

end
# 勉強用のためのコメントアウト
# デバイスをインストールしていればresourcesいらないと思ったんだけどなぁ。どこまでができおう範囲内？
# →基本的にデバイスに関してはルーティング、コントローラーに関してはノータッチでOK