class NewClaimRequestMailer < ApplicationMailer
  default to: 'fpaccess.lspu@gmail.com'

  def new_request(claim_request)
    @claim_request = claim_request
    @user = @claim_request.user
    mail(from: @user.email, subject: 'New Claim Request')
  end
end
