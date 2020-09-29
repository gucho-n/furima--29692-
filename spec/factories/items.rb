FactoryBot.define do
  factory :item do
    name                  { '出品' }
    address_id            { 2 }
    category_id           { 2 }
    condition_id          { 2 }
    estimate_of_deliver_id { 2 }
    description { 2 }
    price { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.png')
    end
  end
end

# 学習用のメモ
# ユーザーIDはITEMSカラムには存在しないため、アソシエーションをしていることを明記。"association :user"がないと"User must exist"が表示されてしまう
# アクティブストレージを使ったら当然ITEMSの方にカラムは存在しませんが、バリデーションを記述するためにあえて記入します
# テストのやり方は２つで、モデルにAFTERを記入してその中にテストで使う画像を記入する方法と、テストコードそのものに入れるやり方
# 気をつけなくてはいけないのは""ではなくnilを使いましょう
