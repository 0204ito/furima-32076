FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    last_name             { 'あア亜' }
    first_name            { 'あア亜' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birth_date            { 123 }
    email                 { Faker::Internet.email }
    # orderのFactoryBotで→user_id   {FactoryBot.create(:user).id}を使うと２つ同じユーザーレコードができるとバリデーションに反するため。自動で違うemailを生成してもらう。
    password              { Faker::Internet.password(min_length: 6) + 'a3' }
    password_confirmation { password }
  end
end
