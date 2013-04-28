class AddUserIdToInviteCodes < ActiveRecord::Migration
  def change
    add_column :invite_codes, :user_id, :integer
  end
end
