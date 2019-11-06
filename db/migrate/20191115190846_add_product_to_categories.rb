class AddProductToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :product, null: false, foreign_key: true
  end
end
