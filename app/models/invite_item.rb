class InviteItem < ActiveRecord::Base
  attr_accessible :description, :title, :url
  has_many :invite_codes
  belongs_to :user
end
