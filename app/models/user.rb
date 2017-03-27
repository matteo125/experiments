class User < ActiveRecord::Base
  has_many :microposts
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
