# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# CSV.read(uri).each do |row|
#       University.create(
#         :building_address => row[9],
#         :agency => row[3],
#         :complaint_type => row[6],
#         :descriptor => row[5],
#         :created => row[1],
#         :closed => row[2],
#         )
# end
require 'csv'

CSV.foreach("uk-higher-education.csv") do |col|
  University.create(
  	:country => col[0],
  	:region => col[1],
  	:name => col[2]
  	)
end