class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
			t.string 	:name
			t.integer :country_id
		  t.string 	:short
		  t.string 	:abbr
		  t.string 	:short2
    end
  end

  def self.down
    drop_table :states
  end
end
