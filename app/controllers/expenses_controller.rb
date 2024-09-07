class ExpensesController < ApplicationController
  def index
    @expenses = DailyExpense.order(created_at: :desc).page(params[:page])
  end
end
