# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("/documents/absci/antibodies/db/data.csv", headers: true) do |row|

	antibodies = {
		target: row[0],
		vendor: row[1],
		product: row[2],
		isotype: row[3]
	}

	if Antibody.where(antibodies).empty?
		Antibody.create(antibodies) 
	end
end

