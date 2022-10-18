class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :day_to_ship
  belongs_to :user


  validates :item_name,              presence: true
  validates :comment,                presence: true
  validates :price,                  presence: true
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id      numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_to_ship_id          numericality: { other_than: 1 , message: "can't be blank"}

end
