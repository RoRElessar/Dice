class AddCatogoryImageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :category_image, :string
  end
end
