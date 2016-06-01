class Gateway::CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index, layout: "application_without_sidebar.haml"
  end


  def payment_form
    @card = Card.new

    customer = MercadoPago::Customer.find(current_user.customer_id)

    @cards = customer.cards

    @payment_provider = params[:payment_provider]
    render 'payment_form', layout: "application_without_sidebar.haml"
  end

  def create
    # @card = CardToken.create({card_token: params[:token],
    #                      user_id: current_user.id,
    #                      provider_prefix: params[:paymentMethodId],
    #                      payment_provider: params[:provider],
    #                      last4: params[:last4],
    #                      first6: params[:first6]})

    params[:customer_id] = current_user.customer_id
    p "params: #{params}"
    card = MercadoPago::Card.new(params)
    card.save

    redirect_to "/gateway/cards/payment_form?payment_provider=#{params[:provider]}"
  end

  def destroy
    card = MercadoPago::Card.find(params[:id])
    card.destroy

    redirect_to "/gateway/cards/payment_form?payment_provider=#{params[:provider]}"

  end
end