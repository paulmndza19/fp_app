require "administrate/field/base"

class LastPaymentField < Administrate::Field::Base
  def to_s
    data.strftime('%B %d %Y')
  end
end
