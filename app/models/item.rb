class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :goods, presence: true
  validates :product, presence: true
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliverycost
  belongs_to :place
  belongs_to :daystoship

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :place_id
    validates :days_to_ship_id
  end
end
