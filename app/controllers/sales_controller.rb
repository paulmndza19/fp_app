class SalesController < ApplicationController
  def index
    @sales = DailySale.order(created_at: :desc).page(params[:page])
  end
end
