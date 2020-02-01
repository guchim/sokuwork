class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :profile_photo
      t.string :introduction
      t.integer :user_id
      t.timestamps
    end
  end
end
