FactoryBot.define do
  factory :item do
      goods            { '商品テスト' }
      product          { '商品説明テスト' }
      category_id      { 2 }
      condition_id     { 2 }
      delivery_cost_id { 2 }
      place_id         { 2 }
      days_to_ship_id  { 2 }
      price            { 500 }

      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end


  end
end
