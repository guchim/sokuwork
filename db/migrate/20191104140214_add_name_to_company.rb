class AddNameToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string, null: false, default: ""
    add_column :companies, :phone_number, :string
  end
end
