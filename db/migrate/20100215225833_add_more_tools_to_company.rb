class AddMoreToolsToCompany < ActiveRecord::Migration
  def self.up
 		add_column :companies, :finance, :boolean
  	add_column :companies, :maintenance, :boolean
  	add_column :companies, :procedures, :boolean
 		add_column :companies, :providers, :boolean
  	add_column :companies, :personnel, :boolean
  	add_column :companies, :money_collect, :boolean
  end

  def self.down
	  remove_column :companies, :finance
  	remove_column :companies, :maintenance
  	remove_column :companies, :procedures
  	remove_column :companies, :providers
  	remove_column :companies, :personnel
  	remove_column :companies, :money_collect
  end
end
