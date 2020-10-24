FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id  { 3 }
    postage_payer_id {2 }
    prefecture_seller_id {2}
    send_date_id { 2 }
    price {3000}
    association :user
  end
end
