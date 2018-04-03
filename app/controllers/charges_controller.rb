class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = params[:total] * 100

    customer = Stripe::Customer.create(
      :email => "email@email.com",
      :source  => params[:token][:id],
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    puts charge
    render json: charge.to_json
  rescue Stripe::CardError => e
    puts e
  end
end