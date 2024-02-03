FactoryBot.define do
  factory :user do
    nickname              {Faker::Lorem.word}
    email                 {Faker::Internet.email}
    password              {'t1' + Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birth_date              {Faker::Date.birthday}
  end
end