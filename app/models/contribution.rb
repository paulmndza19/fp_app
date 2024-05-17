class Contribution < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_paper_trail
  acts_as_paranoid

  before_validation :set_receipt_number

  validates :receipt_number, uniqueness: true

  belongs_to :user

  RECEIPT_NUMBER_LENGTH = 3

  def created_by
    return if versions.blank?

    user_id = versions.first&.whodunnit

    return if user_id.nil?

    User.find(user_id).name
  end

  def updated_by
    return if versions.blank?

    user_id = versions.last&.whodunnit

    return if user_id.nil?

    User.find(user_id).name
  end

  private

  def set_receipt_number
    latest_receipt_number_length = latest_receipt_number.nil? ? 1 : latest_receipt_number.to_s.length
    current_date = Time.zone.now
    current_month = current_date.strftime("%-m")
    current_day = current_date.strftime("%d")
    current_year = current_date.strftime("%Y")
    self.receipt_number = "#{current_month}#{current_day}#{current_year}-#{'0' * (RECEIPT_NUMBER_LENGTH - latest_receipt_number_length)}#{latest_receipt_number + 1}"
  end

  def latest_receipt_number
    latest_contribution = Contribution.where(created_at: Time.zone.now.all_day).order(created_at: :desc).limit(1).first

    return 0 if latest_contribution.nil?

    latest_contribution.receipt_number.split("-").last.to_i
  end
end
