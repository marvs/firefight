# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8
#bundle exec rake db:seed:dump MODELS=Member APPEND=true TIMESTAMPS=false


# encoding: utf-8

User.create(email: 'test@mambin.com', password: 'changeme', password_confirmation: 'changeme')
User.first.update_attribute(:admin, true)

Member.create([
  { :name => "AB", :active => true, :elder => true },
  { :name => "cambridgesoljas", :active => true, :elder => true },
  { :name => "Vonhausen", :active => true, :elder => true },
  { :name => "Tank", :active => true, :elder => true },
  { :name => "Pennske", :active => true, :elder => false },
  { :name => "Gamerbilly", :active => true, :elder => true },
  { :name => "Agathorn", :active => true, :elder => true },
  { :name => "Kongen Nikola", :active => true, :elder => true },
  { :name => "jq", :active => true, :elder => true },
  { :name => "VonHausen", :active => true, :elder => true },
  { :name => "7manqtr90", :active => true, :elder => false },
  { :name => "chopaheadoff", :active => true, :elder => false },
  { :name => "itsjon1997", :active => true, :elder => true },
  { :name => "D3@TH$T4R", :active => true, :elder => false },
  { :name => "Shirei", :active => true, :elder => true },
  { :name => "Jay", :active => true, :elder => false },
  { :name => "devastator3489", :active => true, :elder => true },
  { :name => "wathen27", :active => true, :elder => true },
  { :name => "mike", :active => true, :elder => true },
  { :name => "y3*76k", :active => true, :elder => false },
  { :name => "bjt_16", :active => true, :elder => true },
  { :name => "gundy", :active => true, :elder => false },
  { :name => "Ghost", :active => true, :elder => true },
  { :name => "dberg101", :active => true, :elder => true },
  { :name => "harms023", :active => true, :elder => false },
  { :name => "D1-BIGDOG", :active => true, :elder => true },
  { :name => "Bakers22", :active => true, :elder => false },
  { :name => "leo isadore", :active => true, :elder => false },
  { :name => "aug3600", :active => true, :elder => true },
  { :name => "AMbrosiac", :active => true, :elder => true },
  { :name => "durango", :active => true, :elder => false },
  { :name => "kalani", :active => true, :elder => true },
  { :name => "matt the great", :active => true, :elder => true },
  { :name => "Sir Rider11", :active => true, :elder => true },
  { :name => "ryan4066", :active => true, :elder => false },
  { :name => "Mistress", :active => true, :elder => true },
  { :name => "Beanie", :active => true, :elder => false },
  { :name => "awesome", :active => true, :elder => false },
  { :name => "MAJESTY 88", :active => true, :elder => true },
  { :name => "SushiOfDoom", :active => true, :elder => false },
  { :name => "zach", :active => true, :elder => false },
  { :name => "hercules", :active => true, :elder => false },
  { :name => "swagdaddygang", :active => true, :elder => false },
  { :name => "mccarthy", :active => true, :elder => false },
  { :name => "bradders28", :active => true, :elder => true },
  { :name => "AGB-AB", :active => true, :elder => false }
])


