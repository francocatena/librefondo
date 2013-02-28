class TrustFund < ActiveRecord::Base
  has_paper_trail
  
  has_magick_columns name: :string

  PERCENTS = %w(coupon_tv coupon_tv_cap coupon_tv_floor differential_margin tcpe minimal_cost maximal_cost)

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fund_id, :name, :base, :coupon_tv, :coupon_tv_cap, :coupon_tv_floor, :nominal_value, :differential_margin, :broadcast_cost, :price, :rating, :buy_date, :settlement_date, :broadcast_date, :expiration_date, :tenancy, :purchase_price, :tcpe, :minimal_cost, :maximal_cost, :cut_date, :payments_attributes, :number_of_payments, :identifier, :lock_version, :total, :ric, :fund_ids

  attr_accessor :fund_id ,:total
 
  # Scopes

  # Validations
  validates :name, presence: true
  validates :name, length: { maximum: 255 }, allow_nil: true, allow_blank: true
  validates :name, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true

  # Relations
  has_many :funders
  has_many :funds, through: :funders
  has_many :payments, inverse_of: :trust_fund, dependent: :destroy

  accepts_nested_attributes_for :payments, allow_destroy: true
  
  # Callbacks
  before_save :convert_values_to_percent

  # Instance or Class methods
  def convert_values_to_percent
    PERCENTS.each do |percent|
      self.send("#{percent}=", self.send(percent)/100) if self.send("#{percent}_changed?")
    end
  end

  def self.filtered_list(query)
    query.present? ? magick_search(query) : scoped
  end
end
