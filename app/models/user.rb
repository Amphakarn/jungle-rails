class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  # auto_strip_attributes :email, :nullify => false
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    email_lowercase = email.downcase
    user = User.find_by(email: email_lowercase)
    if user && user.authenticate(password)
      return user
    end    
  end
end
