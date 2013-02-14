class Fund < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name, :rate_id
  
  has_many :trust_funds
  has_many :payments, through: :trust_funds
end
