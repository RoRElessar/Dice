class CartsController < ApplicationController

  def show
    @cart = Cart.find(session[:cart_id])
    @line_items = @cart.line_items
    @order = Order.new
  end

  def destroy
    @cart = current_cart
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    if @cart.destroy
      redirect_to root_path, notice: 'Корзина очищена'
    else
      redirect_to :back, alert: 'Что-то пошло не так...'
    end
  end

end
