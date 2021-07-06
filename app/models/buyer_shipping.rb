class BuyerShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :phone_number, :area_id, :ship_city, :ship_address, :ship_to_address, :postal_code, :token

  with_options presence:true do
    validates :user_id
    validates :item_id
    validates :ship_city
    validates :ship_address
    validates :token
    
  end  
  validates :area_id, numericality: { other_than: 1 }
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shipping.create(ship_address: ship_address, ship_city: ship_city, ship_to_address: ship_to_address, area_id: area_id, postal_code: postal_code, phone_number: phone_number, buyer: buyer)

  end
end    