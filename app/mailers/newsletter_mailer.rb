class NewsletterMailer < ApplicationMailer
  def newsletter_email(user)
    @user = user
    mail(to: user.email, subject: 'Recipease monthly newsletter - Want to try some Chicken Alfredo Primavera?')
  end
end
