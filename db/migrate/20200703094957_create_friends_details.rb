class CreateFriendsDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :friends_details do |t|
      t.string :feature
      t.string :content
      t.references :friend, foreign_key: true

      t.timestamps
    end
  end
end
