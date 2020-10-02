class OrdersController < ApplicationController
  def index
    @price = 999999999
  end



# ここのnew/createは最後にユーザーバリデーションでまとめたものを記述する
  #「配送先住所」に編集
    def new
      @order = UserValidation.new
    end
      # なんで2回もNewするのかな？
    #「クレジットカード情報」に編集
    def create
      @order = UserValidation.new(order_params) 
      if @order.save
            redirect_to root_path
      else
        render_to "orders"
      end      
    end

  private

   
  def order_params
    params.require(:user_validation).permit(:number,:exp_month,:exp_year,:cvc,:postcode,:phonenuber,:city,:block,:building,:address_id)
    
  end


end




