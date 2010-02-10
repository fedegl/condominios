class AddToolsToCompany < ActiveRecord::Migration
  def self.up
  	add_column :companies, :security, :boolean
  	add_column :companies, :cleaning, :boolean
  	add_column :companies, :gardening, :boolean
  end

  def self.down
  	remove_column :companies, :security
  	remove_column :companies, :cleaning
  	remove_column :companies, :gardening
  end
end
