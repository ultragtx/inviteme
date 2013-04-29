class FrontPageController < ApplicationController
  layout 'application'
  def index
    @current_invite_items = InviteItem.where(public: true)
  end
end
