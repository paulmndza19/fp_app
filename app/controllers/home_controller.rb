class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
    render :layout => false
  end


  # def set_last_contribution
  #   current_month = current_date.strftime("%B")
  #   current_year = current_date.strftime("%Y")
  #   self.last_posted_contribution = "#{current_month}#{current_year}"
  # end

  # @current_date = Time.zone.now
  # @current_month = @last_posted_contribution.created_at.strftime("%B")
  # @current_year = @last_posted_contribution.created_at.strftime("%Y")
  # @last_posted_contribution = "#{current_month}-#{current_year}"

  def dashboard
    @contributions = Contribution.joins(:user).where(user: { deleted_at: nil }).order(created_at: :desc).limit(5)
    @user_count = User.count
    @total_contributions = Contribution.sum(:amount)
    @total_number_contributions = Contribution.count
    @your_contributions_count = current_user.contributions.count(:amount)
    @your_total_contributions = current_user.contributions.sum(:amount)

    @your_last_contribution = current_user.contributions.order(created_at: :desc).first
    @approved_claim_requests = current_user.claim_requests.approved
  end

  def create
    super
  rescue StandardError => e
    flash[:alert] = e.message
    redirect_to new_session_path(resource_name)
  end
end
