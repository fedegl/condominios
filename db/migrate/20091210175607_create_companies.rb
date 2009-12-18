class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.column :name,					:string
      t.column :description,	:string
      t.column :price,				:string
      t.column :phone,				:string
      t.column :city,					:string
      t.column :state_id,			:integer
      t.column :country_id,		:integer            
    end
  end

  def self.down
    drop_table :companies
  end
end
