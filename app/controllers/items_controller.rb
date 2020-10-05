class ItemsController < ApplicationController
  before_action :set_Item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :shipping_charge_id, :address_id, :category_id, :condition_id, :estimate_of_deliver_id).merge(user_id: current_user.id)
  end

  def set_Item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
