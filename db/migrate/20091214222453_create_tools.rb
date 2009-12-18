class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools do |t|
			t.string :name
			t.string :description
			t.integer :company_id
    end
  end

  def self.down
    drop_table :tools
  end
end
