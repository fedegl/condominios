class AddCompanyIdToExperiences < ActiveRecord::Migration
  def self.up
  	add_column :experiences, :company_id, :integer
  end

  def self.down
  	remove_column :experiences, :company_id
  end
end
