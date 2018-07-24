# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |team|
  Team.create(name: "Team#{team+1}")
  10.times do |user|
    User.create(email:"asdf#{user+1}@asdf#{team+1}.com", password:"asdfasdf", first_name: "Joe#{user+1}", last_name: "Bloggs#{user+1}", team_id: Team.last.id)
    3.times do |post|
      Post.create(date: Date.today, rationale: "Lesson#{post+1}", user_id: User.last.id)
      5.times do |video|
        Video.create(heading: "Video#{video+1}", link: "https://www.youtube.com/watch?v=Xv1goNyR7PU", post_id: Post.last.id)
      end
    end
  end
end








puts "3 teams have been created"
puts "10 users per team has been created"
puts "3 posts per user have been created"
puts "5 videos per post have been created"
