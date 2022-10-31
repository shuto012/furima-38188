class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order
end