class UserPageController < ApplicationController
  layout 'application'
  def account
    @current_invite_items = current_user.invite_items
    @current_invite_codes = current_user.invite_codes
  end
end
