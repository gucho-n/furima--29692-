class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :address
  belongs_to_active_hash :estimate_of_deliver

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
end
# ①どのアクティブハッシュとアソシエーションをつなげるかの記述
# ②belongs_to_active_hash :conditionを記述することによりどのアクティブハッシュと繋がるか確認できました