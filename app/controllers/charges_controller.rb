class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    # @amount = params[:total];
    # byebug

    customer = Stripe::Customer.create(
      :email => "email@email.com",
      :source  => params[:payment][:id],
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:total],
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )
    # byebug
    render json: charge.to_json
  rescue Stripe::CardError => e
    puts e
  end
end
