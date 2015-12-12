module ApplicationHelper

  def line_items_cart
    @cart = Cart.find(session[:cart_id])
    @line_items_cart = @cart.line_items
  end

end
