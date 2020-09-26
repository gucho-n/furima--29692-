FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    #Faker対象外
    surname               { '谷口' }
    firstname             { '祐人' }
    surname_kana          { 'タニグチ' }
    firstname_kana        { 'ユウト' }
    birthday { '19871116' }
  end
end


# メモ用 
# テストに必要な値をランダムで呼んでくれる。このファイルは自分で作成します。
# Fakerで以下のようなものは使えないのでようか？
# surname               {Faker::Name.initials(number: 2)}
# firstname              {Faker::Name.initials(number: 2)}
# surname_kana               {Faker::Name.initials(number: 2)}
# firstname_kana              {Faker::Name.initials(number: 2)}


