class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  belongs_to :category

  mount_uploader :product_image, ProductImageUploader

  def to_param
    "#{:id}-#{title.parameterize}"
  end
end
