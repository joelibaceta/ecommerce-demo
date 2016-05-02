module ProductsHelper
  def has_new_ribbon?(id)
    product = Product.find(id)
    days = (Time.now - product.updated_at).to_i / 86400
    return (days.to_i < 5)
  end
end
