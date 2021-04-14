FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {"sample@sample.com"}
    password              {"aaa000"}
    password_confirmation    {password}
    family_name           {"山田"}
    family_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2021-01-01"}
  end
end