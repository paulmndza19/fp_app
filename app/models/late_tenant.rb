class LateTenant < Tenant
  DAYS_FOR_LATE_PAYMENT = ENV.fetch('NUMBER_OF_DAYS_FOR_CONSIDERING_LATE_RENT_PAYMENT', 2).to_i

  default_scope { left_joins(stall_rentals: :rental_payments).where.not({ rental_payments: {created_at: Time.zone.now...DAYS_FOR_LATE_PAYMENT.days.ago}}).distinct }

  def last_payment
    RentalPayment.joins(stall_rental: :tenant).order(created_at: :desc).limit(1)&.first&.created_at
  end
end
