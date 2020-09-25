class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :surname, presence: true  
  validates :firstname, presence: true
  validates :surname_kana, presence: true
  validates :firstname_kana, presence: true
  # emailとpasswordについてはデフォルトで「存在しないと保存できない」というバリデーションが用意されている
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  # あってるかわからないが英数字指定は正規表現を使う。赤字の部分を代入してパスワードに使う
  # マッチは特定の値をチェックするだけ
 
 
end
