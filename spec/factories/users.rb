FactoryBot.define do
  factory :user do
    nickname              { 'kkk' }
    last_name             { 'あア亜' }
    first_name            { 'あア亜' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birth_date            { 123 }
    email                 { 'test@example' }
    password              { 'a11111' }
    password_confirmation { password }
  end
end
