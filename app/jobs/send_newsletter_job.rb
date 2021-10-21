class SendNewsletterJob
  def self.perform
    puts "put newsletter mailer function here"
    # UserMailer.welcome_email('dollosa.christian@gmail.com').deliver_now
  end
end
