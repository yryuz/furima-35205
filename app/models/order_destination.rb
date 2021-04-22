class OrderDestination
  include ActiveModel::Model
  attr_accessor :order, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end


  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :phone_number, format: {with: /\A\d{11}\z/}

  def save
    order = Order.create(user_id: user_id,item_id: item_id )
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end