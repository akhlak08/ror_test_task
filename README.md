# README

Technical Requirement:
* Ruby version ("3.0.0")
* Rails version (>= 7.0.3.1)
* Posgtres (12.11)
* Redis Server (for sidekiq)

Project Setup for Development Environment:
* gem install bundler
* bundle install
* rails db:create
* rails db:migrate
* database.yml file (set username and password for postgres)
* please do mailer configuration in development.rb file(smtp configuration, add username and token)
* rails s