class CreateComplexOffers < ActiveRecord::Migration
  def self.up
    create_table :complex_offers do |t|
      t.integer :company_id
      t.integer :complex_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :complex_offers
  end
end
