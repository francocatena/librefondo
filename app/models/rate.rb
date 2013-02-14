class Rate < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name, :value, :kind

end
