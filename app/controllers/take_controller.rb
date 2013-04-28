class TakeController < ApplicationController
  def index
    rand_key = params[:key]
    @current_invite_item = InviteItem.find_by_rand_key(rand_key)
    @current_invite_code = InviteCode.where(invite_item_id: @current_invite_item.id, taken: false).first
    
  end
end
