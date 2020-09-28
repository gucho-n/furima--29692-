FactoryBot.define do
  factory :item do
    name                  { '出品' }
    address_id            { 1 }
    category_id           { 1 }
    condition_id          { 1 }
    estimate_of_deliver_id { 1 }
    description { 1 }
    price { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.png')
    end
  end
end

# 学習用のメモ
# ユーザーIDはITEMSカラムには存在しないため、アソシエーションをしていることを明記。"association :user"がないと"User must exist"が表示されてしまう
