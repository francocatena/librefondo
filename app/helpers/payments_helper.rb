module PaymentsHelper
  def amount_per_notice(payment)
    (payment.estimated_amount || 0)*(payment.trust_fund.try(:tenancy) || 0)
  end

  def residual_value_per_notice(payment)
    (payment.residual_value || 0)*(payment.trust_fund.try(:tenancy) || 0)
  end

  def income_value(payment)
    (payment.net_value || 0)*(payment.trust_fund.try(:tenancy) || 0)*BigDecimal.new(100)
  end

  def total_value(payment)
    (income_value(payment) || 0)+(amount_per_notice(payment) || 0)
  end

  def in_percent(value)
    "#{value*BigDecimal.new(100)}%"
  end

  def total_estimated_amount(payment)
    (payment.amortization || 0)+(amount_per_notice(payment) || 0)
  end

  def duration(payment)
    if payment.persisted?
      total_amount = total_value(payment)
      days_to_settlement = payment.date-payment.trust_fund.settlement_date
      minimal_percent = BigDecimal.new(1)+payment.trust_fund.minimal_cost
      (total_amount*days_to_settlement)/(minimal_percent**(days_to_settlement/BigDecimal.new(365)))
    end
  end

  def mduration(payment)
    if payment.persisted?
      total_amount = total_value(payment)
      days_to_settlement = payment.date-payment.trust_fund.settlement_date
      minimal_percent = BigDecimal.new(1)+payment.trust_fund.minimal_cost
      total_amount/(minimal_percent**(days_to_settlement/BigDecimal.new(365)))
    end
  end
end
