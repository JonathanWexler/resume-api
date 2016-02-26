
class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :password

  before_save :encrypt_password

  def encrypt_password
    puts "encrypting"
    if !password.nil?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def full_name
    fname + " " + lname
  end

  def as_json(options = {})
    super(options.merge({ except: [:password_salt, :password_hash] }))
  end
end


class Experience < ActiveRecord::Base
  # attr_accessor :title, :password_confirmation


end