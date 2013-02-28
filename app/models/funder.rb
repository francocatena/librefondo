class Funder < ActiveRecord::Base
  has_paper_trail

  attr_accessible :trust_fund_id, :fund_id

  belongs_to :trust_fund
  belongs_to :fund

end
