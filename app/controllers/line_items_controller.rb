class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      redirect_to :back, notice: 'Игра добавлена в корзину.'
    else
      redirect_to :back
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    if
      @line_item.destroy
      redirect_to :back, notice: 'Игра удалена из корзины'
    else
      redirect_to :back, alert: 'Что-то пошло не так...'
    end
  end

end
