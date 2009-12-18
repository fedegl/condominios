class ChangeComplexTypesCompaniesName < ActiveRecord::Migration
  def self.up
    rename_table :complex_types_companies, :companies_complex_types
  end

  def self.down
    rename_table :companies_complex_types, :complex_types_companies
  end
end
