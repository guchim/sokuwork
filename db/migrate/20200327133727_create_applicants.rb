class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :offer_id
      t.timestamps
    end
  end
end
