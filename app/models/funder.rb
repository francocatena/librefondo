class Funder < ActiveRecord::Base
  has_paper_trail

  # Setup accessible (or protected) attributes for your model
  # Deprecated in rails 4
  # attr_accessible :trust_fund_id, :fund_id

  # Scopes

  # Validations

  # Relations
  belongs_to :trust_fund
  belongs_to :fund

  # Callbacks
  # Instance or Class methods
end
