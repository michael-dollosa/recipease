class SendNewsletterJob
  def self.perform
    Rails.logger.debug 'put newsletter mailer function here'
    Newsletter.all.each do |user|
      NewsletterMailer.newsletter_email(user).deliver_now
    end
  end
end
