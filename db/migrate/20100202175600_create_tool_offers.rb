class CreateToolOffers < ActiveRecord::Migration
  def self.up
    create_table :tool_offers do |t|
      t.integer :company_id
      t.integer :tool_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tool_offers
  end
end
