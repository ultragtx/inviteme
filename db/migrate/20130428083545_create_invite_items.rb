class CreateInviteItems < ActiveRecord::Migration
  def change
    create_table :invite_items do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :rand_key
      t.string :public

      t.timestamps
    end
  end
end
