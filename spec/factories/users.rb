FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '太郎' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
