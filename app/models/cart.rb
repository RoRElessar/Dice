class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :orders

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.amount += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

end
