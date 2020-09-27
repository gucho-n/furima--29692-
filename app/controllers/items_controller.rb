class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
  end
  def new
    @item = Item.new
    
  end
  # ここのnewは、formwithを使う時にモデル名をインスタンス変数で渡してあげる必要がある

  def create
   Item.create(item_params)
   redirect_to root_path
  end

  private

  def item_params

    params.require(:item).permit(:name, :description, :image, :price, :shipping_charge_id, :address_id, :category_id, :condition_id,:estimate_of_deliver_id).merge(user_id: current_user.id)
    
  end

 
end
# ストロングパラメーターを記入する時には、アクティブハッシュで入れるべきデータも忘れないこと
# itemにはどのユーザーが出品したかわからない.→merge(user_id: current_user.id)と記入すれば、勝手に今のUserIDが入力される。


# itemが生成された状態はこんなかんじ
#<ItemsController>)> @item
#<Item:0x00007f90e3199620
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

