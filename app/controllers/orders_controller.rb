class OrdersController < ApplicationController

  before_action :set_Price, only: [:index,:create]
  before_action :move_to_root

  def index 
    @order = UserOrder.new
  end
  # 価格は１つなので、findで一つ拾う。このパラムスは入力した時のパラムスではなく遷移した時に生まれるパラムス
  # 基本的にform_with運ばれたものを指定するが、これは違う
  # アクションが何であろうと、遷移した時に入力があるときは、生成してあげる
  # (params[:item_id])はパスのID（rails routesを見て確認）

  # パラムスの役割
  #   ＊1.form_withからデータを渡す→モデルに渡す
  #   ＊2.ネストしている時に必要なIDを記述
    # ここの@orderを生成する役割
    #   ＊form_withのモデルに渡すため
  # createとUpdateの区別はどうやっているのか？
      # ＊インスタンスに値が渡されているか否か
  # ここのnew/createは最後にユーザーバリデーションでまとめたものを記述する
  # 「配送先住所」に編集

  # 「クレジットカード情報」に編集
  def create
   
    # //効かないのではなく、毎回indexに行っているのでは？
    @order = UserOrder.new(order_params) 
      
    if  @order.valid?
        @order.save
        redirect_to root_path
    else
        render action: :index
    end
    
   
  end

  private

  def order_params
  
    params.require(:user_order).permit(:postcode, :phonenumber, :city, :block, :building, :address_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token] )
    
  
  end
  def set_Price
    @price = Item.find(params[:item_id])
   
  end

  def pay_item
    Payjp.api_key = "sk_test_18b8f13aedf09044e120ae95"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  def move_to_sign_in

    unless user_signed_in?
    redirect_to new_user_session_path
    end
    # action:を入れるとコントローラーに
    # 入れないとページにいく
  end
  
  def move_to_root
    @item = Item.find(params[:item_id])

    if user_signed_in? && (current_user.id == @item.user.id)
       redirect_to root_path
    end
  end




end
