class CreateOfferWalfares < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_walfares do |t|
      t.integer :offer_id
      t.integer :walfare_id
      t.timestamps
    end
  end
end
