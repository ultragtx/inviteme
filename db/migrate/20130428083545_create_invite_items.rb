class CreateInviteItems < ActiveRecord::Migration
  def change
    create_table :invite_items do |t|
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
