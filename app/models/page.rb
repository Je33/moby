class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :site
  belongs_to :template
  has_many :blocks
end
