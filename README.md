# BetterOn Portal v2

Development version of the BetterOn Portal

## Starting rails app
- Run: bundle exec puma -C config/puma.rb -b tcp://127.0.0.1:3001
- Go to 127.0.0.1:3001 in Chrome

## If didn't shutdown properly
- Restart postgres server
- brew services restart postgresql

## Bootstrap
- Don't use bootstrap sass
- Install bootstrap 4 (don't need sprockets)

## Models
- Team
- x User
- x Post
- Video (nested in Post)

## Features
- Coaches can access by team
- Admin can switch user roles and assign teams
- Users have tailored GIF profile picture
- Branded environment
- Upload to YouTube from portal

## To-do
