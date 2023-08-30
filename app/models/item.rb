class Item < ApplicationRecord
  has_one :buyer
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :place
  belongs_to :days_to_ship

  with_options numericality: { other_than: 1,message: "can't be blank" } do

    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :place_id
    validates :days_to_ship_id
  end
end
