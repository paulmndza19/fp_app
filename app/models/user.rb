class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_paper_trail
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :contributions
  has_many :claim_requests

  def name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    role.name.downcase == 'admin'
  end
end
