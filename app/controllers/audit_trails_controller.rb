class AuditTrailsController < ApplicationController
  def index
    @versions = PaperTrail::Version
      .where(whodunnit: current_user.id)
      .where.not(event: "destroy")
      .order(created_at: :desc)
      .page(params[:page])
  end
end
