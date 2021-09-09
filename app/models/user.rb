class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :set_access_token

  private
       
  def set_access_token
    self.auth_token = generate_token
  end
       
  def generate_token
    loop do
      token = SecureRandom.hex(8)
      break token unless User.where(auth_token: token).exists?
    end
  end
end
