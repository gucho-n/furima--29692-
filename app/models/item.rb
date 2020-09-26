class Item < ApplicationRecord




  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :origin
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :estimate_of_deliver

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
end
