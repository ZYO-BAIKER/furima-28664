FactoryBot.define do
  factory :order_address do
    postal_code             { 123-4567 }
    prefecture_id           { 2 }
    city                    { '横浜市緑区' }
    house_number            { '青山' }
    building_name           { '柳ビル１０３' }
    phone_number            { '09012345678' }
  end
end