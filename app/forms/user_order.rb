class UserOrder

  include ActiveModel::Model
  # これがよくわからん→ストロングパラメーターみたいな
  attr_accessor :postcode, :phonenumber, :city, :block, :building, :address_id, :user_id, :item_id,:token,:item_purchase_id

  
  # # 名前のフォーマットのバリデーションを加える

  with_options presence: true do
  #   # 氏名用
 
  # 「住所」の郵便番号に関するバリデーション
  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  # 「住所」の都道府県に関するバリデーション
  validates :address_id, numericality: { other_than: 0, message: "can't be blank" }
  # 「住所」の都市名に関するバリデーション
  validates :city, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "can't be blank" }
  # 「住所」の都市名に関するバリデーション なし

  # 「住所」の市区町村に関するバリデーション なし

  # 「住所」の電話番号に関するバリデーション
  validates :phonenumber, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
   # 各のデータを保存している
   # IDを保存するために変数を入れておく(item情報は既に作成しているので、呼び出しさえすればいいんちゃう？Idが欲しい)
  #  Itemの購入IDの生成のため
  
   def save
    # ユーザーの情報を保存し、「itempurchase」という変数に入れている
    item_purchase = ItemPurchase.create!(user_id: user_id ,item_id: item_id)
    
    # クレジットカードの情報を保存
  
    # 住所の情報を保存
    DeliverAddress.create!(postcode: postcode,phonenumber: phonenumber,city: city,block: block,building: building,address_id: address_id,item_purchase_id: item_purchase.id)
  end
  

end