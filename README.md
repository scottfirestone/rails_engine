#Rails Engine

##Setup

To use, clone down this repo:

`$ git clone https://github.com/scottfirestone/rails_engine.git`

Bundle those gems: 

`$ bundle install` 

To set up the database run:

`$ rake db:{create, migrate}`

To populate the database with the csv's included in this repository, run:

`$ rake csv:load_to_db`

##Testing

Testing suite built in RSpec. To run:

`$ rspec`

##Endpoints

This is all about endpoints. Consult the [project spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md) for more information.
