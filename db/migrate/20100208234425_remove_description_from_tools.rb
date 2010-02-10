class RemoveDescriptionFromTools < ActiveRecord::Migration
  def self.up
  	remove_column :tools, :description
  end

  def self.down
  	add_column :tools, :description, :string
  end
end
