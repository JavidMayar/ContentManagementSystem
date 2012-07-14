class Page < ActiveRecord::Base
  default_scope :order => 'title'
  validates :title, :body, :permalink, :presence => true
  validates :title, :uniqueness => true
end
