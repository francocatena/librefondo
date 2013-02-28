class Fund < ActiveRecord::Base
  has_paper_trail

  has_magick_columns name: :string

  attr_accessible :name
  
  has_many :funders
  has_many :trust_funds, through: :funders
  has_many :payments, through: :trust_funds

  def self.filtered_list(query)
    query.present? ? magick_search(query) : scoped
  end
end
