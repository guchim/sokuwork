class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :images
      t.integer :category_id
      t.string :title, null: false
      t.date :date, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.text :contents, null: false
      t.text :caution, null: false
      t.integer :company_id
      t.timestamps
    end
  end
end
