class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :category, null: false
      t.string :title, null: false
      t.date :date, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.text :contents, null: false
      t.text :caution, null: false

      t.timestamps
    end
  end
end
