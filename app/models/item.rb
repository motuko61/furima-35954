class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area 
  belongs_to :condition 
  belongs_to :category
  belongs_to :charge
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :user, presence: true
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :description, presence: true
  validates :condition_id, numericality: { other_than: 1 } 
  validates :charge_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :days_to_ship_id, numericality: { other_than: 1 } 

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
      presence: { message: 'is invalid' } 
  end
  
  
end
  
