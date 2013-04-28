class CreateInviteCodes < ActiveRecord::Migration
  def change
    create_table :invite_codes do |t|
      t.string :content
      t.boolean :taken

      t.timestamps
    end
  end
end
