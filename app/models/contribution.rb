class Contribution < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_paper_trail
  acts_as_paranoid

  belongs_to :user

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
end
