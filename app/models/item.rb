class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :condition
  belongs_to :category
  belongs_to :charge
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image
  has_one :buyer

  with_options presence: true do
    validates :image
    validates :user
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :days_to_ship_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: 'is invalid' }
  end
end
