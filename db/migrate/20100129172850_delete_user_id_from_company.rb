class DeleteUserIdFromCompany < ActiveRecord::Migration
  def self.up
  	remove_column :companies, :user_id
  end

  def self.down
  	add_column :companies, :user_id, :integer
  end
end
