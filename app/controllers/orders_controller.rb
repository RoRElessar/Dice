class OrdersController < ApplicationController

  def create
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
      if @order.save
        Cart.destroy(session:[:cart_id])
        redirect_to root_path, notice: 'Ваш заказ оформлен, ожидайте звонка, мы скоро с Вами свяжемся.'
      else
        redirect_to :back, alert: 'Что-то пошло не так...'
      end
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :email, :address, :pay_type)
  end

end
