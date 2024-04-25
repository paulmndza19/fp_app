class HomeController < ApplicationController
  def index
    @total_contributions = current_user.contributions.sum(:amount)
  end
end
