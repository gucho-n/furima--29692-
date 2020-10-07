FactoryBot.define do
  factory :user_order do
    token { '0000000000000000' }
    postcode { '000-0000' }
    address_id { 1 }
    city { '富士宮市' }
    block { '東林間' }
    building { '１−2−３' }
    phonenumber { '09087657889' }
  end
end
