# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin, :set_paper_trail_whodunnit

    def authenticate_admin
      authenticate_user!
    end

    def authenticate_user!
      super
        redirect_to '/admin/users' if current_user.is_secretary? && params["controller"] != 'admin/users'

        president_controllers = [
          'admin/sales_reports',
          'admin/kiosk_rental_reports',
          'admin/expense_reports',
          'admin/cashflow_reports'
        ]
  
        redirect_to '/admin/cashflow_reports' if current_user.is_president? && !president_controllers.include?(params["controller"])

        redirect_to '/', alert: "You do not have access to this resouce" unless current_user.is_admin? || current_user.is_secretary? || current_user.is_president?
  
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
