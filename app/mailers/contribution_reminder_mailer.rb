class ContributionReminderMailer < ApplicationMailer
  def reminder_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reminder: Contributions Due Before 7th of the Month')
  end
end
