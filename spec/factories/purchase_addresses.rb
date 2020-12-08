FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 5 }
    municipality { '岡山市北区' }
    address { '大供3-3' }
    building { '岡山大供' }
    phone_number { '09064534546' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
