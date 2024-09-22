class NewClaimRequestMailer < ApplicationMailer
  default from: 'fpaccess.lspu@gmail.com'

  def new_request(claim_request)
    @claim_request = claim_request
    @user = @claim_request.user
    mail(to: @user.email, subject: 'New Claim Request')
  end
end
