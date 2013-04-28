class AddInviteItemIdToInviteCodes < ActiveRecord::Migration
  def change
    add_column :invite_codes, :invite_item_id, :integer
  end
end
