Rails.application.routes.draw do
  devise_for :users 
  # デバイスをインストールしていればresourcesいらないと思ったんだけどなぁ→多分正解
  root to: 'items#index'
  

end
