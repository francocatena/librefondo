class TrustFund < ActiveRecord::Base
  has_paper_trail

  attr_accessible :fund_id, :name, :base, :coupon_tv, :coupon_tv_cap, :coupon_tv_floor, :nominal_value, :rate_id, :differential_margin, :broadcast_cost, :price, :rating, :buy_date, :settlement_date, :broadcast_date, :expiration_date, :tenancy, :purchase_price, :tcpe, :minimal_cost, :maximal_cost, :kind_id, :cut_date

  belongs_to :funds
  has_one :rate
  has_many :payments
   
end
