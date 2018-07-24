# BetterOn Portal v2

Development version of the BetterOn Portal

## Starting rails app
- Run: bundle exec puma -C config/puma.rb -b tcp://127.0.0.1:3001
- Go to 127.0.0.1:3001 in Chrome

## Database server issues
- Restart postgres server
- brew services restart postgresql

## Bootstrap
- Don't use bootstrap sass
- Install bootstrap 4 (don't need sprockets)

## Models
- Team
- User
- Course
- Post
- Video (nested in Post)

## Features
- Lesson breakdown; each lesson can have numerous videos
- Lessons can act as checkpoints, thus gamifying the experience
- Possibly having courses->lessons->videos?
- Discuss a "review functionality"
- Coaches can access team
- Admin can assign users with different permissions and distribute teams
- Users have tailored GIF for videos
- Branded environment by team (give team feel with company colors)
- Upload to YouTube from portal
- BetterOn DIY signup
- Video-level feedback mechanism; text/comments-based
- Modular feedback videos
- Sharing videos amongst team (video specific)

## Levels of access
- Admin
- Coach
- User

## To-do
- Make the nested routes test more rigorous
- Test for permissions

## Discussion
- Make us rethink the training program
- Customizable
- Commenting not necessary
- At either Lesson level, have customizable slider counters
- Eye contact; overall presentation; progress
- Coach is to amplify how users experience themselves
