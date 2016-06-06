class ProductsController < ApplicationController
  
  def index
    category = Category.find(params[:category]) rescue nil
    products = Product.all
    products =products.where(category_id: category) if category
    products = products.order("updated_at DESC ")

    @products = products.page(1).per(7)

    page = params[:page]
    if page
      @products = products.page(page).per(7)
      render partial: "grid", layout: false
    else
      render :index
    end

  end
  
end
