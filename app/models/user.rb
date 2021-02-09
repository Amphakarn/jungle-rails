class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
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
