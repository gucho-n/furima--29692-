class ItemsController < ApplicationController
  def index

    @items = Item.all.order('created_at DESC')
     

  end
  

  def new
    @item = Item.new
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
   
   
  end
 

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


