class AddCompnanyIdToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :company_id, :integer
  end
end
