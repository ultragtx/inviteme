class InviteItem < ActiveRecord::Base
  attr_accessible :description, :title, :url, :rand_key, :public
  has_many :invite_codes
  belongs_to :user
end
