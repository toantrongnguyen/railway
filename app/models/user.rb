class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  before_create :create_activated_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  attr_accessor :remember_token, :activated_token

  def remember
    self.remember_token = User.secure_token
    update_attribute(:remember_digest, User.digest(remember_token))
    return remember_token
  end

  def remember_user?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  class << self
    def digest(password)
      BCrypt::Password.create(password)
    end

    def secure_token
      SecureRandom.urlsafe_base64
    end
  end
  
  private
    def create_activated_token
      self.activated_token = User.secure_token
      self.activated_digest = User.digest(activated_token)
    end
end
