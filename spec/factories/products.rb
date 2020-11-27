FactoryBot.define do
  factory :product do
    name { 'ボール' }
    explanation { 'サッカーボール' }
    category_id { 1 }
    status_id { 1 }
    fee_id { 1 }
    place_id { 1 }
    day_id { 1 }
    price { 300 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
