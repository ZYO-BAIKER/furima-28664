FactoryBot.define do
  factory :order_address do
    token                   { 'tok_abcdefghijk00000000000000000'}
    postal_code             {  '183-0031' }
    prefecture_id           { 2 }
    city                    { '横浜市緑区' }
    house_number            { '青山通り' }
    building_name           { '柳ビル１０３' }
    phone_number            { '09012345678' }
    user_id                 { 2 }
    item_id                 { 1 }
  end
end
