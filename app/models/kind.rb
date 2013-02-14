class Kind < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name, :daily_acrual, :cut_date

  end
