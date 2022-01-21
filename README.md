# __Animal Shelter API__

#### _Epicodus' Ruby code review on building an API_

#### _Created by: **Matt C.**_

## Technologies Used

* _Ruby_
* _RSpec_
* _Pry_
* _Postgres_
* _SQL_
* _Rails_
* _ActiveRecord_
* _Faker_
* _Factory Bot_
* _Docker_
* _Shoulda-Matchers_
* _Will-Paginate_
* _Rack-Cors_

## Description
_An API with full CRUD functionality for animals at an animal shelter. Includes paginating the responses (5 per page), retrieving a random animal, and searching by species. Should have CORS enabled for only GET requests from any domain._

## Endpoints

| Usage | METHOD | V1::URL | Params |
| :---  | :---:  | :--- | ---: |
| See all animals | GET | `localhost:3000/v1/animals` | _page_ |
| See a specific animal | GET | `localhost:3000/v1/animals/:id` |  |
| Create an animal | POST | `localhost:3000/v1/animals` | _name, species, age_ |
| Update an animal | PUT | `localhost:3000/v1/animals/:id` | _name, species, age_ |
| Delete an animal (from the database) | DELETE | `localhost:3000/v1/animals/:id` |  |
| Search for animals of a particular species | GET | `localhost:3000/v1/animals?species=` | _species, page_ |
| Search for animals by name | GET | `localhost:3000/v1/animals?name=` | _name, page_ |
| Get a random animal | GET | `localhost:3000/v1/animals/random` |  |

## Responses

_Expect responses for each animal to look like this:_
```
{
  "id" : integer,
  "name" : string,
  "species" : string,
  "age" : integer,
  "created_at" : timestamp,
  "updated_at" : timestamp
}
```

## Using this app with Ruby 2.6.5 installed natively (no Docker)

* _Run_ `git clone https://github.com/catperso/animal-shelter-api` _in your terminal to clone this repository to your device, then navigate to the project directory._
* _Run_ `bundle install` _to package the Gems and set up Gemfile.lock._
* _Run_ `rake db:setup` _to set up the databases, tables, and seed them with placeholder entries._
* _Run_ `rspec` _if you want to run the model and request specs._
* _Run_ `rails s` _to start a local API server._
* _Make calls to the API server with endpoints listed above._

## Using this app with Docker

* _First make sure Docker is installed as per the official [instructions](https://docs.docker.com/get-docker/)._
* _Run_ `docker pull ruby:2.6.5` _to pull an image for the same version of Ruby this project was built with._
* _Run_ `git clone https://github.com/catperso/animal-shelter-api` _in your terminal to clone this repository to your device, then navigate to the project directory._
* _Run_ `docker-compose run api bundle install` _to bundle the gems and set up Gemfile.lock._
* _Run_ `docker-compose run api sh` _to start a shell inside the container._
* _Run_ `rake db:setup` _in the container shell to set up the databases, tables, and seed them with placeholder entries._
* _Run_ `rspec` _in the container shell if you want to run the model and request specs._
* _In your normal terminal, run_ `docker-compose up --build` _to bundle the app and start up the database and API server containers properly attached to each other._
* _Make calls to the API server with endpoints listed above._

## Further Exploration Objectives

### Pagination
_Using the [Will-Paginate](https://github.com/mislav/will_paginate) gem is very straightforward. Bundling the gem adds nice extra syntax for controllers to paginate results. See the endpoints above for what requests can be paginated._

### CORS
_Following the lessons I used the rack-CORS gem. It was simple to allow CORS from any domain, but only for GET requests, and for more serious projects it would be no trouble to restrict which domains have CORS enabled._

### Authentication (via JWT)
_I was previously able to get this functioning on a practice project, but I wasn't able to figure out how to do tests through authentication, so it is not included in this project._

### Versioning
_I wasn't planning on doing this because I had been looking up gems to use for this, but it turns out rudimentary versioning is entirely namespacing and just a slight adjustment to the routes. Updating my request specs for everything was not difficult, and I'm pretty sure the specs need to be versioned to account for the differences in paths between versions._

## Known Bugs

_You are unable to search for both name and species, although you can paginate either search._

## License - [MIT](https://opensource.org/licenses/MIT)

_If you run into any problems/bugs feel free to send me an email [(mc.casperson@gmail.com)](mailto:mc.casperson@gmail.com) with details._

Copyright (c) _2022 Matt C._