# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("/Users/douggerber/documents/absci/db/antibodies.csv", headers: true) do |row|

	antibodies = {
		target: row[0].gsub(/\,/,"").gsub(/\$/,""),
		vendor: row[1].gsub(/\,/,"").gsub(/\$/,""),
		product: row[2].gsub(/\,/,"").gsub(/\$/,""),
		isotype: row[3].gsub(/\,/,"").gsub(/\$/,"")
	}

	if Antibody.where(antibodies).empty?
		Antibody.create(antibodies) 
	end
end

