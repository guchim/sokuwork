class CreateWalfares < ActiveRecord::Migration[5.2]
  def change
    create_table :walfares do |t|
      t.string :name

      t.timestamps
    end
  end
end
