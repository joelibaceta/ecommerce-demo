class Gateway::SalesController < ApplicationController
  before_action :authenticate_user!

  def new
    #TODO: List payment ways
    render :new, layout: "application_without_sidebar.haml"
  end

  def payment_form
    customer = MercadoPago::Customer.find(current_user.customer_id)

    @cards = customer.cards

    @sale             = Sale.new
    @sale.cart        = Cart.get_current_cart(current_user)
    @payment_provider = params[:payment_provider]
    render 'payment_form'
  end

  def create
    @payment = MercadoPago::Payment.new({
        token: params[:token],
        payment_method_id: params[:payment_method_id],
        transaction_amount: params[:transaction_amount],
        description: "Dummy Payment",
        installments: params[:installments],
        payer: MercadoPago::Payer.new({email: current_user.email})
                                        })

    @payment.to_json

    #if (params[:saveCard])

    begin
      @payment.save

      if (@payment.status == "approved")
        self.get_current_cart(current_user).status = "finished"
      end
    rescue
      puts "No se pudo guardar"
    end

  end

end
