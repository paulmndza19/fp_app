module Admin
  class AuditTrailsController < ApplicationController
    def index
      @versions = PaperTrail::Version
        .includes(:user)
        .order(created_at: :desc)
        .page(params[:page])
    end
  end
end
