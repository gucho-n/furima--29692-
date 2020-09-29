class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end
  # 原則画面遷移する前に下記のアクションは発動してないので
  # 画面遷移する前にインスタンス変数を生成する場合、インデックスであらかじめ生成しておく必要がある

  def new
    @item = Item.new
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end
  # Viewのなかに例えば2というIDを入力して
  # バイプラ先生やったら問題なくできた

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :shipping_charge_id, :address_id, :category_id, :condition_id, :estimate_of_deliver_id).merge(user_id: current_user.id)
  end
end

# 自分用メモ
# リダイレクトについて。ここのnewは、formwithを使う時にモデル名をインスタンス変数で渡してあげる必要がある

# なので、createアクションの中のcreateメソッドをいったん２等してあげる。(newでインスタンス生成、saveで保存、ここのsaveを使ってIF
# 分で分割する)

# ストロングパラメーターを記入する時には、アクティブハッシュで入れるべきデータも忘れないこと
# itemにはどのユーザーが出品したかわからない.→merge(user_id: current_user.id)と記入すれば、勝手に今のUserIDが入力される。

# itemが生成された状態はこんなかんじ
# <ItemsController>)> @item
# <Item:0x00007f90e3199620
#  id: nil,
#  created_at: nil,
#  updated_at: nil,
#  shipping_charge_id: nil,
#  name: nil,
#  address_id: nil,
#  category_id: nil,
#  condition_id: nil,
#  estimate_of_deliver_id: nil,
#  description: nil,
#  price: nil,
#  user_id: nil>

# エラーメッセージの出し方
# ①エラーメッセージを記述
# ②コントローラーに
# URLのような記述を書きます
# （この時にcreateは、生成・保存に分割、インスタンス変数を生成して、保存時でIFぶんで分割する）
# ③VIEWにレンダーを出す
# https://qiita.com/nakanishi03/items/d1be27c74c98855423ab
