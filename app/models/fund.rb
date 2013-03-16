class Fund < ActiveRecord::Base
  has_paper_trail

  has_magick_columns name: :string

  # Setup accessible (or protected) attributes for your model
  # Deprecated in rails 4
  # attr_accessible :name
 
  # Scopes

  # Validations
  validates :name, presence: true
  validates :name, length: { maximum: 255 }, allow_nil: true, allow_blank: true
  validates :name, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true

  # Relations
  has_many :funders
  has_many :trust_funds, through: :funders
  has_many :payments, through: :trust_funds

  # Callbacks

  # Instance or Class methods
  def self.filtered_list(query)
    query.present? ? magick_search(query) : all
  end
end
