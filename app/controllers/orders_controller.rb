class OrdersController < ApplicationController
  before_action :set_Purchase, only: [:index, :create]
  before_action :move_to_root
  before_action :move_to_sign_in

  def index
    @order = UserOrder.new
  end

  def create
    @order = UserOrder.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postcode, :phonenumber, :city, :block, :building, :address_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_Purchase
    @purchase = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
      amount: @purchase.price, # 商品の値段

      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
    # action:を入れるとコントローラーに
    # 入れないとページにいく
  end

  def move_to_root
    @item = Item.find(params[:item_id])

    redirect_to root_path if user_signed_in? && (current_user.id == @item.user.id)
  end
end

#  ~自分用メモ~
# @purchase = Item.find(params[:item_id])
# この価格はparams[:item_id]の意味がわからなかった。paramsの役割の1つ。１つなので、findで一つ拾う。
# 役割は２つ
#   ①ビューから入力したデータ＊基本的にform_with運ばれたものを指定するが、これは違う
#   ②paramsのURIのデータ（）の中は基本的にID＊(params[:item_id])はパスのID（rails routesを見て確認）

# パラムスの役割
#   ＊1.form_withからデータを渡す→モデルに渡す
#   ＊2.ネストしている時に必要なIDを記述

# 購入ボタンが効かなかった。
# 仮説→効かないのではなく、毎回indexに行っているのでは？

# @orderを生成する役割
# form_withのモデルに渡す。
# Q.PATHは同じでもcreateとUpdateの区別はどうやっているのか？
# A.インスタンスに値が渡されているか否か
