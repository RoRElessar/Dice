module ApplicationHelper

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def line_items_cart
    @cart = current_cart
    @line_items_cart = @cart.line_items
  end

end
