class Link < ActiveRecord::Base
  validates_presence_of :url
  validates :url, :url => true
  belongs_to :user
end
