FactoryBot.define do
  factory :user do
    nickname              {"kkk"}
    last_name             {"kkk"}
    first_name            {"kkk"}
    last_name_kana        {"カタカナ"}
    first_name_kana       {"カタカナ"}
    birth_date            {123}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
  end
end