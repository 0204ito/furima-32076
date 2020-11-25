FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'あああ市' }
    house_number { '2の１' }
    building_name { 'あああ３号' }
    phone { 12_345_678_910 }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
