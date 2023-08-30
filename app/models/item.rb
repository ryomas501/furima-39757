class Item < ApplicationRecord
  has_one :buyer
  belongs_to :user
  has_one_attached :image
end
