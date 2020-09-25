Rails.application.routes.draw do
  devise_for :users 
  # デバイスをインストールしていればresourcesいらないと思ったんだけどなぁ。どこまでができおう範囲内？

  root to: 'items#index'
  
  

end
