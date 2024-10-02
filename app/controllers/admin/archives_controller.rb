module Admin
  class ArchivesController < ApplicationController
    before_action :set_paper_trail_version, only: %i[ restore ]

    def index
      @archives = PaperTrail::Version
                    # .joins("join users ON versions.whodunnit::uuid = users.id")
                    .where(whodunnit: current_user.id, event: 'destroy')
                    # .where.not(user: { deleted_at: nil })
                    .order(created_at: :desc)
                    .page(params[:page])
    end

    def restore
      model = @version.item_type.constantize
      record_id = @version.item_id

      record = model.only_deleted.find_by(id: record_id)
      return if record.nil?

      @version.destroy
      record.update(deleted_at: nil)

      redirect_to admin_archives_path, notice: 'Archive restored successfully.'
    end

    private
    def set_paper_trail_version
      @version = PaperTrail::Version.find(params[:id])
    end
  end
end

