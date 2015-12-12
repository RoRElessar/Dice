class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!, except: [:show, :index]

 # def current_cart
 #   Cart.find(session[:cart_id])
 # rescue ActiveRecord::RecordNotFound
 #   cart = Cart.create
 #   session[:cart_id] = cart.id
 #   cart
 # end

  def current_cart

  if session[:cart_id]
    begin
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    rescue ActiveRecord::RecordNotFound =>
      create_cart
    end
  else
    create_cart
  end

    @current_cart
  end

  private

  def create_cart
    @current_cart = Cart.create!
    session[:cart_id] = @current_cart.id
  end


end
