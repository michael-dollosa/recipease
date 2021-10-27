class PaymentsController < ApplicationController
  Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
  def create
    price = Stripe::Price.retrieve('price_1JowTbDKvTdCwkWqCyk0i7N7')
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price: price,
        quantity: 1
      }],
      success_url: payment_success_url,
      cancel_url: payment_cancel_url
                                                })
    redirect_to @session.url
  end

  def success
    redirect_to edit_user_registration_path, success: 'Payment successful! Enjoy added benefits of being a Premium user!'
  end

  def cancel
    redirect_to edit_user_registration_path, danger: 'Payment failed. Kindly double check all information before proceeding to checkout.'
  end
end
