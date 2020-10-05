class DeliverAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address

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
