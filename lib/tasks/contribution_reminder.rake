namespace :contribution_reminder do
  desc "Send reminder emails to all users on the 1st of the month"
  task send_reminders: :environment do
    User.find_each do |user|
      ContributionReminderMailer.reminder_email(user).deliver_later
    end
  end
end
