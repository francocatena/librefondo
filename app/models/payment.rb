class Payment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :date, :trust_fund_id, :kind, :amount

end
