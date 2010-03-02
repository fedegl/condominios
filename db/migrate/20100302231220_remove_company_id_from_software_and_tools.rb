class RemoveCompanyIdFromSoftwareAndTools < ActiveRecord::Migration
  def self.up
    remove_column :softwares, :company_id
    remove_column :tools, :company_id
  end

  def self.down
    add_column :tools, :company_id, :integer
    add_column :softwares, :company_id, :integer
  end
end
