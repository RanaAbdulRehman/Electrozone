class Product < ApplicationRecord
  has_many :order_items
  belongs_to :brand
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
  
  validates :title, presence: true, length: { in: 5..30}, uniqueness: {case_sensitive: false}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 500}
  validates :description, presence: true, length: { in: 10..500 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1} 

  
end
