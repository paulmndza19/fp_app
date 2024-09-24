class ArchivesController < ApplicationController
  before_action :set_paper_trail_version, only: %i[ restore ]

  def index
    @archives = PaperTrail::Version
                  .where(whodunnit: current_user.id, event: 'destroy')
                  .order(created_at: :desc)
                  .page(params[:page])
  end

  def restore
    binding.pry
  end

  private
  def set_paper_trail_version
    @version = PaperTrail::Version.find(params[:id])
  end
end
