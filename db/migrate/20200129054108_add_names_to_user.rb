class AddNamesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string,null: false, default: ""
    add_column :users, :gender, :integer
    add_column :users, :birthday, :date
  end
end
