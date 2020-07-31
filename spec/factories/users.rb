FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Gimei.last}
    first_name            {Gimei.first}
    kana_family_name      {Gimei.last.katakana}
    kana_first_name       {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today - 5.year)}
  end
end