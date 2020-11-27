FactoryBot.define do
  factory :product do
    name { 'ボール' }
    explanation { 'サッカーボール' }
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    place_id { 2 }
    day_id { 2 }
    price { 300 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
