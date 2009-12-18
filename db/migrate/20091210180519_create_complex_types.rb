class CreateComplexTypes < ActiveRecord::Migration
  def self.up
    create_table :complex_types do |t|
      t.string :name
    end
    
    create_table :complex_types_companies, :id => false do |t|
    	t.integer :company_id
    	t.integer :complex_type_id
    end
  end
  
  def self.down
   	drop_table :complex_types
    drop_table :complex_types_companies
  end
end
