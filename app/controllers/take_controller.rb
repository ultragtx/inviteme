class TakeController < ApplicationController
  def index
    rand_key = params[:key]
    @current_invite_item = InviteItem.find_by_rand_key(rand_key)
    
  end
end
