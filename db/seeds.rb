# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Feed.create!(name: "zenn topic rails", url: "https://zenn.dev/topics/rails/feed")
Feed.create!(name: "Ruby Weekly", url: "https://cprss.s3.amazonaws.com/rubyweekly.com.xml")
Feed.create!(name: "THIS WEEK IN RAILS", url: "https://world.hey.com/this.week.in.rails/feed.atom")
Feed.create!(name: "Hotwire Weekly", url: "https://hotwireweekly.com/rss")
Feed.all.each(&:create_items)
