class Product < ApplicationRecord
  has_many :order_items
  belongs_to :brand
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
end
