FactoryBot.define do
  factory :item do
    name             {"商品名"}
    description      {"商品説明"}
    category_id      {1}
    condition_id     {1}
    delivery_fee_id  {1}
    prefecture_id    {1}
    delivery_day_id  {1}
    price            {300}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
