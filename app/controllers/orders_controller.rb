class OrdersController < ApplicationController
  def index
    @price = 999999999
  end

  def create
    @order = DeliverAddress.new
    if @order.save(order_params)
    
        redirect_to root_path
    else
        render "orders"
    end
  end

  private
  def order_params
    params.require(:deliver_address).permit(:postcode,:phonenuber,:city,:block,:building,:address_id)
    binding.pry
  end
end




