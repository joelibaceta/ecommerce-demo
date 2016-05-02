class ProductsController < ApplicationController
  
  def index
    category = Category.find(params[:category]) rescue nil
    @products = Product.all
    @products = @products.where(category_id: category) if category
    @products = @products.order(" created_at DESC ")
  end
  
end
