class NewsletterMailer < ApplicationMailer
  def newsletter_email(email)
    mail(to: email, subject: 'Recipease monthly newsletter - Want to try some Chicken Alfredo Primavera?')
  end
end
