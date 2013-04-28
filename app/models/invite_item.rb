class InviteItem < ActiveRecord::Base
  attr_accessible :description, :title, :url, :rand_key, :public, :codes_str
  attr_accessor :codes_str
  has_many :invite_codes
  belongs_to :user
  
  validates :title, presence: true
  validates :rand_key, :uniqueness => true
end
