require "administrate/field/base"

class ReadOnlyField < Administrate::Field::Base
  def to_partial_path
    "fields/read_only_field/form"
  end
end