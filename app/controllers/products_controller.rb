class ProductsController < ApplicationController
  def index
    @category = Category.where(id: params[:category]).first if params[:category].present?
    @products = if @category.present?
                  @category.products
                else
                  Product.all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_suggestions
    query = params[:query]
    results = if params[:query].present?
                response = []
                Product.where('title ILIKE ? OR description ILIKE ?', "%#{query}%", "%#{query}%").each do |product|
                  obj = {id: product.id, fulltitle: product.title}
                  response << obj
                end
                response
              else
                []
              end
    render json: results
  end
end
