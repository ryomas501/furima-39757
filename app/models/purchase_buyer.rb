class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :place_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :place_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Buyer.create(post_code: post_code, place_id: place_id, city: city, house_number: house_number,
                building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end