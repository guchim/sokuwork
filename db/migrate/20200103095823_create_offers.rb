# frozen_string_literal: true

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
      t.text :cautions, null: false
      t.integer :payment, null: false
      t.integer :company_id
      t.string :address, null: false
      t.string :access
      t.string :belongings
      t.string :conditions
      t.timestamps
    end
  end
end
