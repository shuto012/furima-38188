class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :address_id

  with_options presence: true do
    validates :post_code,          format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"} 
    validates :municipality
    validates :address
    validates :phone_number,         format: { with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :order_id
    validates :address_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: current_user.id)
    Address.create(post_code: post_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end