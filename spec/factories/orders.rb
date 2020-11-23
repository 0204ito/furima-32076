FactoryBot.define do
  factory :order do
    postal_code             { '123-4567' }
    prefecture_id             { 2 }
    city            { 'あああ市' }
    house_number             { '2の１' }
    building_name { 'あああ３号' }
    phone   { 12345678910 }

  end
end
