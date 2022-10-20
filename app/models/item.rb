class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :day_to_ship
  belongs_to :user

  has_one_attached :image

  validates :item_name,              presence: true
  validates :comment,                presence: true
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_to_ship_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,                  presence: true

end
