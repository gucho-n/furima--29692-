class ItemsController < ApplicationController
  def index

    @items = Item.all.order('created_at DESC')
     

  end
  

  def new
    @item = Item.new
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

  def edit
    @item = Item.find(params[:id]) 
     
  end
  def update
    
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
    
  
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :shipping_charge_id, :address_id, :category_id, :condition_id, :estimate_of_deliver_id).merge(user_id: current_user.id)
  end
  
  

end




