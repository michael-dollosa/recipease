class NewsletterMailer < ApplicationMailer
  def newsletter_email(email)
    mail(to: email, subject: 'Recipease monthly newsletter')
  end
end
