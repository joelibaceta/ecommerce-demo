class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user

    _user = super
    mp_customer = MercadoPago::Customer.find_by_id(_user.customer_id) if _user

    if mp_customer.nil? && _user
       MercadoPago::Customer.load(_user.customer_id)
    end
    return _user
  end

end
