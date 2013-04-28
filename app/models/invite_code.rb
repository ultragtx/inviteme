class InviteCode < ActiveRecord::Base
  attr_accessible :content, :taken
  belongs_to :user
  belongs_to :invite_item
end
