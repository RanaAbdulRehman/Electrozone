class AddCategoryRefToBrands < ActiveRecord::Migration[6.1]
  def change
    add_reference :brands, :category, null: false, foreign_key: true
  end
end
