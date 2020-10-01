Rails.application.routes.draw do
  devise_for :users 
  
  root to: 'items#index'

  resources :items 
  resources :orders
  # , only:[:create]

end
# 勉強用のためのコメントアウト
# デバイスをインストールしていればresourcesいらないと思ったんだけどなぁ。どこまでができおう範囲内？
# →基本的にデバイスに関してはルーティング、コントローラーに関してはノータッチでOK

# コントローラーを増やすメリット
# ビューが増やせる
# ルーティングのネストする、IDがつく→１つ１つを選択するのが楽になる
# ルーティングのネストをしない。IDを保存する。保存したIDを引っ張る→めんどくさい
