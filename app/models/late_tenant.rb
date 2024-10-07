class LateTenant < Tenant
  has_paper_trail
  acts_as_paranoid

  DAYS_FOR_LATE_PAYMENT = ENV.fetch('NUMBER_OF_DAYS_FOR_CONSIDERING_LATE_RENT_PAYMENT', 2).to_i

  default_scope do
    left_joins(stall_rentals: :rental_payments)
    .where('rental_payments.payment_date <= ?', DAYS_FOR_LATE_PAYMENT.days.ago.beginning_of_day)
    .where('rental_payments.deleted_at IS NULL') # Ignore soft-deleted payments
    .distinct
  end

  def last_payment
    rental_payments.order(payment_date: :desc).first.payment_date
  end
end
