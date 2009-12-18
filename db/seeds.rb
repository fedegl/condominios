require 'fastercsv'

countries = FasterCSV.read(RAILS_ROOT + "/db/csv/countries.csv")

countries.each do |country|
 Country.create!(:id => country[0], :name => country[1], :short => country[2])
end

states = FasterCSV.read(RAILS_ROOT + "/db/csv/states.csv")

states.each do |state|
 State.create!(:id => state[0], :name => state[1], :country_id => state[2], :short => state[3], :abbr => state[4], :short2 => state[5])
end

complex_types = FasterCSV.read(RAILS_ROOT + "/db/csv/complex_types.csv")

complex_types.each do |complex_type|
 ComplexType.create!(:id => complex_type[0], :name => complex_type[1])
end