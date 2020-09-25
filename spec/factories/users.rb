FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    # 多分できないよね、、
    surname               { '谷口' }
    firstname             { '祐人' }
    surname_kana          { 'タニグチ' }
    firstname_kana        { 'ユウト' }
    birthday { '19871116' }
  end
end

# 多分できないよね、、
# surname               {Faker::Name.initials(number: 2)}
# firstname              {Faker::Name.initials(number: 2)}
# surname_kana               {Faker::Name.initials(number: 2)}
# firstname_kana              {Faker::Name.initials(number: 2)}

# このファイルは手で作成しますがテストに必要な値を適当に作って作成してくれます
