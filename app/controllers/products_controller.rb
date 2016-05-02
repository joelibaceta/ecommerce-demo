class ProductsController < ApplicationController
  
  def index
<<<<<<< HEAD
    category = Category.find(params[:category]) rescue nil
=======
    category = Category.find(params[:category])
>>>>>>> f4667346d4ad90a1aa13a01b52d6a8b712e5de31
    @products = Product.all
    @products = @products.where(category_id: category) if category
    @products = @products.order(" created_at DESC ")
  end
  
end
