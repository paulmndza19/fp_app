# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Secretary
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin, :set_paper_trail_whodunnit

    def authenticate_admin
      authenticate_user!
    end

    def authenticate_user!
      super
      redirect_to '/', alert: "You do not have access to this resouce" unless current_user.is_admin?
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
