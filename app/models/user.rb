class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contributions

  def name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    user_type.downcase == 'admin'
  end
end
