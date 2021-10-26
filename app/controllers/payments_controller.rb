class PaymentsController < ApplicationController
  Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
  def create
    price = Stripe::Price.retrieve('price_1JowTbDKvTdCwkWqCyk0i7N7')
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price: price,
        quantity: 1,
      }],
      success_url: root_url,
      cancel_url: root_url,
    })
    redirect_to @session.url
    # respond_to do |format|
    #   format.js
    # end
  end
end
