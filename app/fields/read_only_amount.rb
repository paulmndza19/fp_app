require "administrate/field/base"

class ReadOnlyAmount < Administrate::Field::Base
  def to_s
    super
  end

  def to_partial_path
    "fields/read_only_amount/form"
  end
end
