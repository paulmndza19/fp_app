class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_paper_trail_whodunnit

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def after_sign_out_path_for(resource)
    "/users/sign_in"
  end
end
