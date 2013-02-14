class Stock < ActiveRecord::Base
  has_paper_trail

  attr_accessible :load_date, :ric, :fund_id
  
  has_many :trust_funds
end
