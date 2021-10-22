class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email, :subscribe_newsletter
  has_many :recipes, dependent: :destroy
  validates :email, :password, presence: true
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
end
