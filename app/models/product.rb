class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
end
