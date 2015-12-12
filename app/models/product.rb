class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :product_image, ProductImageUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Существуют товарные позиции')
      return false
    end
  end

end
