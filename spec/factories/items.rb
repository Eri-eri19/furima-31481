FactoryBot.define do
  factory :item do
    name { 'マスク' }
    category_id { 2 }
    description { Faker::Lorem.sentence }
    item_status_id { 2 }
    delivery_charge_id { 2 }
    delivery_area_id { 2 }
    delivery_day_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
