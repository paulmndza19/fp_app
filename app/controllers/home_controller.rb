class HomeController < ApplicationController
  def index
    @your_total_contributions = current_user.contributions.sum(:amount)

    @total_contributions = Contribution.sum(:amount)
    @user_count = User.count
  end
end
