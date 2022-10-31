class Address < ApplicationRecord
  belongs_to :order

  validates :post_code,            presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :municipality,         presence: true
  validates :address,              presence: true
  validates :phone_number,         presence: true, format: { with: /\A\d{10,11}\z/}
  
end
