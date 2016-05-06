class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def new
    cart = Cart.get_current_cart(current_user)
    product = Product.find(params[:product_id])
    preference = Preference.new({product: product, cart: cart})
  end

  def create
    preference = Preference.new(item_params)
    preference.save
    redirect_to products_path
  end

  def destroy
    item = Preference.find(params[:id])
    item.destroy
    redirect_to products_path
  end

  private
  def item_params
    params.require(:preference).permit(:quantity, :product_id, :cart_id)
  end
end
