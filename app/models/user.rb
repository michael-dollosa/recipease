class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email, :subscribe_newsletter, :set_payment_type
  after_destroy :remove_subscriber
  has_many :recipes, dependent: :destroy
  has_one :payment
  validates :email, presence: true
  validates :username, uniqueness: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def send_welcome_email
    UserMailer.welcome_email(email).deliver_now
  end

  def subscribe_newsletter
    # only proceeds when email is not yet in newsletter model
    Newsletter.create(email: email) if Newsletter.where(email: email).empty?
  end

  def remove_subscriber
    Newsletter.find_by(email: email).delete
  end

  def set_payment_type
    self.create_payment(account_type: 'free')
  end
end
