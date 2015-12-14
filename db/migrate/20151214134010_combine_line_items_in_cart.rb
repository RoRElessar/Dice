class CombineLineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:amount)

      sums.each do |product_id, amount|
        if amount > 1
          cart.line_items.where(product_id: product_id).delete_all

          line_item = cart.line_items.build(product_id: product_id)
          line_item.amount = amount
          line_item.save!
        end
      end
    end
  end

  def down
    LineItem.where("amount>1").each do |line_item|
      line_item.amount.times do
        LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, amount: 1
      end
      line_item.destroy
    end
  end

end
