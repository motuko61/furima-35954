FactoryBot.define do
  factory :item do
    association :user, factory: :user
    area_id           { 2 }
    category_id       { 2 }
    condition_id      { 2 }
    charge_id         { 2 }
    days_to_ship_id   { 2 }

    name              { '商品名' }
    price             { 100_000 }
    description       { '商品の説明' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
