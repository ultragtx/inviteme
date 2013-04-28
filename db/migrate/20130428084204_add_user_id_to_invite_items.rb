class AddUserIdToInviteItems < ActiveRecord::Migration
  def change
    add_column :invite_items, :user_id, :integer
  end
end
