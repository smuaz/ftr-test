# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Religion and Customs')
Category.create(name: 'International')
Category.create(name: 'Sports and Youth')
Category.create(name: 'Natural Disasters')
Category.create(name: 'Economy and Living')
Category.create(name: 'Infrastructure and Facility')
Category.create(name: 'Consumerism')
Category.create(name: 'State Government')
Category.create(name: 'Public Safety')
Category.create(name: 'Health')

State.create(name: 'Johor')
State.create(name: 'Kedah')
State.create(name: 'Kelantan')
State.create(name: 'Melaka')
State.create(name: 'Negeri Sembilan')
State.create(name: 'Pahang')
State.create(name: 'Perak')
State.create(name: 'Perlis')
State.create(name: 'Pulau Pinang')
State.create(name: 'Sabah')
State.create(name: 'Sarawak')
State.create(name: 'Terengganu')
State.create(name: 'Kuala Lumpur')
State.create(name: 'Labuan')

Status.create(name: 'New')
Status.create(name: 'In Process')
Status.create(name: 'Addressed')
Status.create(name: 'Rejected')

Admin.create(name: 'Superadmin', nickname: 'admin', password: 'test123', status: 'active')













