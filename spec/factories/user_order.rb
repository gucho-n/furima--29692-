FactoryBot.define do
  factory :user_order do
    # token.number{"4242424242424242"}
    # token.exp_month{"03"}
    # token.exp_year{"25"}
    # token.cvc{"123"}
    postcode {"0000000"}
    address_id{1}
    city{"富士宮市"}
    block{"東林間"}
    building{"１−2−３"}
    phonenumber{"09087657889"}


    
  end
end