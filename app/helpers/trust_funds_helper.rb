module TrustFundsHelper
  def total_duration(trust_fund)
    total = BigDecimal.new(0)
    trust_fund.payments.each do |payment|
      if payment.persisted?
        total += duration(payment)
      end
    end
    total
  end

  def total_mduration(trust_fund)
    total = BigDecimal.new(0)
    trust_fund.payments.each do |payment|
      if payment.persisted?
        total += mduration(payment)
      end
    end
    total
  end
end
