class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    payload = request.body.read
    event = nil
  
    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    end
  
    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      puts "Payment for #{payment_intent['amount']} succeeded."
      # Then define and call a method to handle the successful payment intent.
      # handle_payment_intent_succeeded(payment_intent)
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      # Then define and call a method to handle the successful attachment of a PaymentMethod.
      # handle_payment_method_attached(payment_method)
    when 'checkout.session.completed'
      puts "Payment checkout succeeded!"
      redirect_to edit_user_registration_path, success: 'Payment successful! Enjoy added benefits of being a Premium user!'
    else
      puts "Unhandled event type: #{event.type}"
      redirect_to edit_user_registration_path, danger: 'Payment failed. Kindly double check all information before proceeding to checkout.'
    end
    status 200
  end
end
