class Item < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :days_to_ship_id, presence: true
  
end
