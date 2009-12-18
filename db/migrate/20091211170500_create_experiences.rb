class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
    	t.string :name
    	t.string :description
    	t.string :start_year
    	t.string :end_year
    end
  end

  def self.down
    drop_table :experiences
  end
end
