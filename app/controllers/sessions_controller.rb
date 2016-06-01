class SessionsController < Devise::SessionsController
  def create
    super do |user|
      MercadoPago::Customer.load(user.customer_id)
    end
  end

  def update
    super do |user|
      MercadoPago::Customer.load(user.customer_id)
    end
  end
end