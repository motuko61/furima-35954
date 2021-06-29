class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area 
  belongs_to :condition 
  belongs_to :category
  belongs_to :charge
  belongs_to :days_to_ship
  belongs_to :user


  validates :user, presence: true
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :price, presence: true
  validates :description, presence: true
  validates :condition_id, numericality: { other_than: 1 } 
  validates :charge_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :days_to_ship_id, numericality: { other_than: 1 } 

  
end
