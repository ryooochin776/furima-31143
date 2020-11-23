FactoryBot.define do
  factory :user do
    nickname {"田中"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    last_name {"田中"}
    first_name {"隼人"}
    last_name_kana {"タナカ"}
    first_name_kana {"ハヤト"}
    birthday {Faker::Date.birthday}
  end
end