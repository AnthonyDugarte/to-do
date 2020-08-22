# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.delete_all
Line.delete_all
Task.delete_all

25.times do
  Project.create!(
    name: Faker::Lorem.words(number: Faker::Number.between(from: 2, to: 20)).join(' ')
  )
end

250.times do
  Line.create!(
    name: Faker::Verb.base,
    project_id: Project.ids[Faker::Number.between(from: 0, to: Project.count - 1)]
  )
end

700.times do
  Task.create!(
    title: Faker::TvShows::BojackHorseman.tongue_twister,
    description: Faker::TvShows::BojackHorseman.quote,
    line_id: Line.ids[Faker::Number.between(from: 0, to: Line.count - 1)]
  )
end
