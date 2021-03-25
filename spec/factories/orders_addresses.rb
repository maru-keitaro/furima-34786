FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address_line { '新宿1-1' }
    building_name { '建物' }
    phone_number { '11111111111' }
  end
end
