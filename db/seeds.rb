# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@blink = Artist.create!(name: "Blink-182")
@small_things = @blink.songs.create!(title: "All The Small Things", length: 846, play_count: 122344123)
@what_age = @blink.songs.create!(title: "What's My Age Again", length: 890, play_count: 122312323)