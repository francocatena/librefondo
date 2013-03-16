class Payment < ActiveRecord::Base
  has_paper_trail

  # Setup accessible (or protected) attributes for your model
  # Deprecated in rails 4
  # attr_accessible :date, :trust_fund_id, :kind, :amount, :estimated_amount, :amortization, :pay_day, :daily_acrual, :lock_version, :residual_value, :amount_per_notice, :residual_value_per_notice, :period_rate, :net_value, :income_value, :total_amount, :total_value, :duration, :mduration

  attr_accessor :amount_per_notice, :residual_value_per_notice, :income_value, :total_amount, :total_value, :duration, :mduration

  # Scopes
  default_scope -> { order('date ASC') }

  # Validations
  validates :trust_fund, :date, :amortization, presence: true

  # Relations
  belongs_to :trust_fund, inverse_of: :payments

  # Callbacks
  before_save :set_estimated_amount, :set_residual_value, :set_period_rate, :set_net_value

  # Instance or Class methods
  def set_estimated_amount
    estimated_amount = self.amortization.nil? ? 0 : (self.amortization/self.trust_fund.broadcast_cost)
    if estimated_amount < 0
      self.estimated_amount = 0
    else
      self.estimated_amount = estimated_amount
    end
  end

  def set_residual_value
    if (self.previous).nil?
      if self.estimated_amount.nil? && self.amount.nil?
        self.residual_value = BigDecimal.new(1)
      else
        self.residual_value = BigDecimal.new(1) - self.estimated_amount
      end
    else
      self.residual_value = self.previous.residual_value - self.estimated_amount
    end
  end

  def set_period_rate
    self.period_rate = (self.trust_fund.try(:tcpe)/self.trust_fund.try(:base))*self.try(:pay_day)
  end

  def set_net_value
    if self.previous.nil?
      self.net_value = self.period_rate/BigDecimal.new(100)
    else
      self.net_value = (self.period_rate*self.previous.residual_value)/BigDecimal.new(100)
    end
  end

  def previous
    Payment.unscoped.where('date(payments.date) < date(?) AND payments.trust_fund_id = ?', self.date, self.trust_fund_id).order("id DESC").first
  end

  def next
    Payment.unscoped.where('date(payments.date) > date(?) AND payments.trust_fund_id = ?', self.date, self.trust_fund_id).order("id ASC").first
  end
end
