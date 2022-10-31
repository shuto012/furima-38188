class Address < ApplicationRecord
  belongs_to :order

  validates :post_code,            presence: true
  validates :prefecture_id,        presence: true
  validates :municipality,         presence: true
  validates :address,              presence: true
  validates :phone_number,         presence: true
  
end
