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
      Rails.logger.debug { "⚠️  Webhook error while parsing basic request. #{e.message})" }
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      Rails.logger.debug { "Payment for #{payment_intent['amount']} succeeded." }
      # Then define and call a method to handle the successful payment intent.
      # handle_payment_intent_succeeded(payment_intent)
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      # Then define and call a method to handle the successful attachment of a PaymentMethod.
      # handle_payment_method_attached(payment_method)
    when 'checkout.session.completed'
      Rails.logger.debug 'Payment checkout succeeded!'
      puts JSON.parse(request.body.read)
      puts 'trying hash'
      puts JSON.parse(request.body.read)["payment_intent"]
      @payment_intent = JSON.parse(request.body.read)["payment_intent"]
      @payment = Payment.find_by(payment_intent: @payment_intent)
      @payment.account_type = 'premium'
      @payment.save
    else
      Rails.logger.debug { "Unhandled event type: #{event.type}" }
    end
    status 200
  end
end
