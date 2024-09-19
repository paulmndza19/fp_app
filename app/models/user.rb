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

  before_validation :set_member_id, on: :create

  validates :member_id_number, uniqueness: true, on: :create

  MEMBER_ID_NUMBER_LENGTH = 3

  def name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    role.name.downcase == 'admin'
  end

  def is_member?
    role.name.downcase == 'member'
  end

  private

  def set_member_id
    latest_member_id_length = latest_member_id.nil? ? 1 : latest_member_id.to_s.length
    current_date = Time.zone.now
    current_year = current_date.strftime("%y")
    self.member_id_number = "01#{current_year}-#{'0' * (MEMBER_ID_NUMBER_LENGTH - latest_member_id_length)}#{latest_member_id + 1}"
  end

  def latest_member_id
    latest_user = User.order(created_at: :desc).limit(1).first

    return 0 if latest_user.nil?

    latest_user.member_id_number.split("-").last.to_i
  end
end
