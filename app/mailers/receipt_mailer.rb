class ReceiptMailer < ApplicationMailer
  def receipt_email(payment)
    @payment_date = payment.updated_at.strftime('%B %d, %Y')
    mail(to: payment.user.email, subject: 'Enjoy Recipease Premium!')
  end
end
