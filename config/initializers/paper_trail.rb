PaperTrail.config.enabled = true
PaperTrail.config.has_paper_trail_defaults = {
  on: %i[create update destroy]
}

# config/initializers/paper_trail.rb
# PaperTrail::Rails::Engine.eager_load!

module PaperTrail
  class Version < ::ActiveRecord::Base
    belongs_to :user, foreign_key: :whodunnit
  end
end
