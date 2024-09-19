class ArchivesController < ApplicationController
  def index
    @archives = PaperTrail::Version
                  .where(whodunnit: current_user.id, event: 'destroy')
                  .order(created_at: :desc)
                  .page(params[:page])
  end
end
