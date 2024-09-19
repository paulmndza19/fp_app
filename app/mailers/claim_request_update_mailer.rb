class ClaimRequestUpdateMailer < ApplicationMailer
  # Mail for approval
  def approval_email(claim_request)
    @claim_request = claim_request
    @user = @claim_request.user
    mail(to: @user.email, subject: 'Your Record Has Been Approved')
  end

  # Mail for rejection
  def rejection_email(claim_request)
    @claim_request = claim_request
    @user = @claim_request.user
    mail(to: @user.email, subject: 'Your Record Has Been Rejected')
  end
end
