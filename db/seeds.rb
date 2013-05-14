# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(
  [
    {name: "Amanda Lou", title: "Execute Assistant", study_experience: "North Carolina", work_experience: "Ipsum Lorem blah", email: "Amanda@blah.com"},
    {name: "Jason Wang", title: "Senior Manager", study_experience: "UC Berkeley", work_experience: "Ipsum Lorem blah", email: "Jason@blah.com"},
    {name: "Mike Ten", title: "Assistant", study_experience: "North Carolina", work_experience: "Ipsum Lorem blah", email: "Mike@blah.com"},
    {name: "Bruce Willy", title: "Assistant", study_experience: "NTU", work_experience: "Ipsum Lorem blah", email: "Bruce@blah.com"}
  ]
)