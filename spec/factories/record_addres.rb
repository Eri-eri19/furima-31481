FactoryBot.define do
  factory :record_addres do
    postal_code { '123-4567' }
    municipality { Faker::Lorem.sentence }
    street_number { '横浜市緑区青山1-1' }
    phonenumber { '09012345678' }
    delivery_area_id { 2 }
    building_name { '柳ビル101' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
