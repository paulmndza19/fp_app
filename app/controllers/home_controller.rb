class HomeController < ApplicationController
  def index
    @your_total_contributions = current_user.contributions.sum(:amount)

    @total_contributions = Contribution.sum(:amount)
    @user_count = User.count
    @contributions = Contribution.includes(:user).order(created_at: :desc).limit(5)
  end
end
