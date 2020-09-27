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
    params.require(:item).permit(:name, :description, :image, :price)
    
    #
  end

 
end
