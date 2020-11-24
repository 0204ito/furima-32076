FactoryBot.define do
  factory :order do
    postal_code             { '123-4567' }
    prefecture_id             { 2 }
    city            { 'あああ市' }
    house_number             { '2の１' }
    building_name { 'あああ３号' }
    phone   { 12345678910 }
    token {"tok_abcdefghijk00000000000000000"}
    user_id   {FactoryBot.create(:user).id}#ユーザーを一つ作成（組織一つも自動に生成）
    item_id   {FactoryBot.create(:item).id}#アイテムを一つ作成（組織一つも自動に生成）
  end
end
