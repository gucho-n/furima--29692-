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

  validates :image, :name, :address_id, :category_id, :condition_id, :estimate_of_deliver_id, :description, :price, presence: true
  less_price = 300
  over_price = 9_999_999

  validates :price, numericality: { only_interger: true }
  validates :price, numericality: { greater_than_or_equal_to: less_price.to_i }
  validates :price, numericality: { less_than_or_equal_to: over_price.to_i }
  def was_attached?
    image.attached?
  end
end

# 学習用メモ
# ①どのアクティブハッシュとアソシエーションをつなげるかの記述
# ②belongs_to_active_hash :conditionを記述することによりどのアクティブハッシュと繋がるか確認できました

# バリデーションしただけでエラー分が出ていない

# less_price = 300
# over_price = 9999999

# validates :price, :numericality => { :only_interger => true }
# validates :price, :numericality => { :greater_than_or_equal_to => less_price.to_i }
# validates :price, :numericality => { :less_than_or_equal_to => over_price.to_i }
