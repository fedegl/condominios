class AddUserIdToCompany < ActiveRecord::Migration
  def self.up
  	add_column :companies, :user_id, :integer
  end

  def self.down
  	remove_column :companies, :user_id
  end
end
