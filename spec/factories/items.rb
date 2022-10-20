FactoryBot.define do
  factory :item do
    item_name                    {'商品名'}
    comment                      {'aaa'}
    price                        {'1000'}
    category_id                  {2}
    condition_id                 {2}
    prefecture_id                {2}
    delivery_charge_id           {2}
    day_to_ship_id               {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
