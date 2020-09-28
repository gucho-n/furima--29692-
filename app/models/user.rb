class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday, :surname, :surname_kana, :firstname, :firstname_kana, presence: true

  # emailとpasswordについてはデフォルトで「存在しないと保存できない」というバリデーションが用意されている
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # VALID_PASSWORD_REGEXは特にこの名前でなくても問題ない
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # 氏名用
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :surname, format: { with: VALID_NAME_REGEX }
  validates :firstname, format: { with: VALID_NAME_REGEX }

  # 氏名用かな
  VALID_KANA_NAME_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/.freeze
  validates :surname_kana, format: { with: VALID_KANA_NAME_REGEX }
  validates :firstname_kana, format: { with: VALID_KANA_NAME_REGEX }

  has_many :items
  has_many :item_purchases
end

# 自分用メモ

# あってるかわからないが英数字指定は正規表現を使う。赤字の部分を代入してパスワードに使う
# マッチは特定の値をチェックするだけ
