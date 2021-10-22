class SendNewsletterJob
  def self.perform
    Rails.logger.debug 'put newsletter mailer function here'
    # UserMailer.welcome_email('dollosa.christian@gmail.com').deliver_now
  end
end
