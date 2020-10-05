class UserOrder

  include ActiveModel::Model
  # これがよくわからん→ストロングパラメーターみたいな
  attr_accessor :postcode, :phonenumber, :city, :block, :building, :address_id, :user_id, :item_id


  
  # # 名前のフォーマットのバリデーションを加える
  # と思ったが今回共有するものないやん

  # with_options presence: true do
  #   # 氏名用
  # VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  # validates :surname, format: { with: VALID_NAME_REGEX }
  # validates :firstname, format: { with: VALID_NAME_REGEX }

  # # 氏名用かな
  # VALID_KANA_NAME_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/.freeze
  # validates :surname_kana, format: { with: VALID_KANA_NAME_REGEX }
  # validates :firstname_kana, format: { with: VALID_KANA_NAME_REGEX }

   # 各のデータを保存している
   # IDを保存するために変数を入れておく(item情報は既に作成しているので、呼び出しさえすればいいんちゃう？Idが欲しい)
  #  Itemの購入IDの生成のため
  
   def save
    # ユーザーの情報を保存し、「itempurchase」という変数に入れている
    # itempurchase = ItemPurchase.create(user_id: ,item_id:)
    # クレジットカードの情報を保存
  
    # 住所の情報を保存
    DeliverAddress.create(postcode: postcode,phonenumber: phonenumber,city: city,block: block,building: building,address_id: address_id)
  end


end