class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.integer:user_id
      t.integer:company_id
      t.integer:offer_id
      t.string:name
      t.string:photo
      t.string:introduction
      t.string:phone_number
      t.string:birthday
      t.string:gender
      t.timestamps
    end
  end
end
