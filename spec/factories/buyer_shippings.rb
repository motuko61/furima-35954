FactoryBot.define do
  factory :buyer_shipping do
    postal_code { '123-4567' }
    phone_number { '08011111111' }
    area_id           { 2 }
    ship_city { '東京都' }
    ship_address { '1-1' }
    ship_to_address { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
