require 'elasticsearch/model'
class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :order_items
  belongs_to :brand
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
  
  def self.search_title(title,min_price,max_price)
    self.search(
    {
      query: 
      {
        bool: 
        {
          must: 
          [
              { match: { title: title }},
              { range: { price: 
                              { gte: min_price, lte: max_price } 
                       }}
          ]
        }
      }
    })
  end
  
end
