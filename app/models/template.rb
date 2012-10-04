class Template < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :site
  has_many :pages
end
