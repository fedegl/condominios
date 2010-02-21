class CreateSoftwareOffers < ActiveRecord::Migration
  def self.up
    create_table :software_offers do |t|			
			t.integer :company_id
			t.integer :software_id
    end
  end

  def self.down
    drop_table :software_offers
  end
end
