class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    render :layout => false
  end

  def dashboard
    @contributions = Contribution.includes(:user).order(created_at: :desc).limit(5)
    @user_count = User.count
    @total_contributions = Contribution.sum(:amount)
    @your_total_contributions = current_user.contributions.sum(:amount)
  end

  def create
    super
  rescue StandardError => e
    flash[:alert] = e.message
    redirect_to new_session_path(resource_name)
  end
end
