FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_kana      {"タナカ"}
    first_name_kana       {"タロウ"}
    birth_day             {"1990.01.01"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end
