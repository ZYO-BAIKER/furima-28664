FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"松本"}
    first_name            {"人志"}
    family_name_kana      {"マツモト"}
    first_name_kana       {"ヒトシ"}
    birth_date            {Faker::Date.birthday(min_age: 10)}
  end
end