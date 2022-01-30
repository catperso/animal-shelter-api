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
* _[Postman](https://www.postman.com/)_

## Description
_An API with full CRUD functionality for animals at an animal shelter. Includes paginating the responses (5 per page), retrieving a random animal, and searching by species. Should have CORS enabled for only GET requests from any domain._

## Usage

### Posting Animals

_To add animals to the database through the API, make a POST request to `localhost:3000/v1/animals` with key-value pairs in the body of the request for `name=<string>, species=<string>, age=<integer>`. Sending the request will give the response of the entry just created._

_For example, if you made a POST to `localhost:3000/v1/animals` with the key-values in the body `name="Sir Bors", species="cat", age=8`, the response would look something like:_

```
{
  "id" : 122,
  "name" : "Sir Bors",
  "species" : "cat",
  "age" : 8,
  "created_at" : timestamp,
  "updated_at" : the same timestamp
}
```

_Posting an animal without all three required key-values will return an error. For example, if you only had a species and age with no name, the response would be `{ "message": "Validation failed: Name can't be blank" }`._

### Updating Animals

_To update animals in the database using the API, make a PUT request to `localhost:3000/v1/animals/:id` with any key-value pairs you would like to change in the body of the request for `name=<string>, species=<string>, age=<integer>`. Sending the request will give a confirmation message that the animal has been successfully updated._

_You only need to include the key-values you wish to update in the request. The others can be left out._

### Searching by name or species

_You can filter responses from the API by either name or species, although you cannot currently do both at the same time. Simply pass the search parameters in the URL to only return animals with matching name or species._

_For example, if you posted a GET request to `localhost:3000/v1/animals?name=Snot`, it would only return animals in the database with the `name:` of "Snot". This parameter is case insensitive, so it would also return any animal named "snot" or "SNOT"._

_If you posted a GET request to `localhost:3000/v1/animals?species=cat`, it would return all animals in the database with the `species:` of "cat". This parameter is also case insensitive, so it would also return any "CAT"s as well, but it would not return any "dog"s._

_However, if you tried to search by both species and name, it would only search by species and ignore the name parameter._

### Paginating the response

_GET requests for all animals or searching (by name or species) can all be paginated, so instead of getting a list of every animal in the response, `page=1` would return the first five, `page=2` would return the next five, and so on. The last page of animals might have less than 5 entries, and any pages beyond that will return a blank response._

_For example, if you posted a GET request to `localhost:3000/v1/animals?page=1`, it would return only 5 animals in the response, regardless of how many are in the complete database, and it would look something like this:_

```
[
    {
        "id": 122,
        "name": "Sir Bors",
        "species": "cat",
        "age": 8,
        "created_at": "2022-01-29T23:23:38.478Z",
        "updated_at": "2022-01-29T23:23:38.478Z"
    },
    {
        "id": 121,
        "name": "Bir Sors",
        "species": "cat",
        "age": 8,
        "created_at": "2022-01-21T23:31:45.182Z",
        "updated_at": "2022-01-29T23:30:46.308Z"
    },
    {
        "id": 81,
        "name": "Boxing Kangaroos",
        "species": "cat",
        "age": 15,
        "created_at": "2022-01-21T17:22:43.715Z",
        "updated_at": "2022-01-21T17:22:43.715Z"
    },
    {
        "id": 82,
        "name": "Ashina Uzumaki",
        "species": "cat",
        "age": 1,
        "created_at": "2022-01-21T17:22:43.720Z",
        "updated_at": "2022-01-21T17:22:43.720Z"
    },
    {
        "id": 83,
        "name": "Akamaru",
        "species": "cat",
        "age": 14,
        "created_at": "2022-01-21T17:22:43.724Z",
        "updated_at": "2022-01-21T17:22:43.724Z"
    }
]
```

_You can also paginate search results the same way by adding the `page=` parameter in the url before or after your search parameter. For example:_

GET `localhost:3000/v1/animals?species=cat&page=1` _would return the first five cats._

GET `localhost:3000/v1/animals?page=1&name=Snot` _would return the first five animals named Snot._

_All responses are ordered by the latest `updated_at:` timestamp._

## Full Endpoints

| Usage | METHOD | V1::URL | Params |
| :---  | :---:  | :--- | ---: |
| See all animals | GET | `localhost:3000/v1/animals` |  |
| See all animals paginated | GET | `localhost:3000/v1/animals?page=<integer>` | _page_ |
| See a specific animal | GET | `localhost:3000/v1/animals/:id` |  |
| Create an animal | POST | `localhost:3000/v1/animals` | _name, species, age_ |
| Update an animal | PUT | `localhost:3000/v1/animals/:id` | _name, species, age_ |
| Delete an animal (from the database) | DELETE | `localhost:3000/v1/animals/:id` |  |
| Search for animals by species | GET | `localhost:3000/v1/animals?species=<string>` | _species_ |
| Search for animals by species paginated | GET | `localhost:3000/v1/animals?species=<string>&page=<integer>` | _species, page_ |
| Search for animals by name | GET | `localhost:3000/v1/animals?name=<string>` | _name_ |
| Search for animals by name paginated| GET | `localhost:3000/v1/animals?name=<string>&page=<integer>` | _name, page_ |
| Get a random animal | GET | `localhost:3000/v1/animals/random` |  |

## Running this app with Ruby 2.6.5 installed natively (no Docker)

* _Run_ `git clone https://github.com/catperso/animal-shelter-api` _in your terminal to clone this repository to your device, then navigate to the project directory._
* _Run_ `bundle install` _to package the Gems and set up Gemfile.lock._
* _Run_ `rake db:setup` _to set up the databases, tables, and seed them with placeholder entries._
* _Run_ `rspec` _if you want to run the model and request specs._
* _Run_ `rails s` _to start a local API server._
* _Make calls to the API server with endpoints listed above._

## Running this app with Docker

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
_Using the [Will-Paginate](https://github.com/mislav/will_paginate) gem is very straightforward. Bundling the gem adds nice extra syntax for controllers to paginate results. See the endpoints above for what requests can be._

### CORS
_Following the lessons I used the rack-CORS gem. It was simple to allow CORS from any domain, but only for GET requests, and for more serious projects it would be no trouble to restrict which domains have CORS enabled._

### Authentication (via JWT)
_I was previously able to get this functioning on a practice project, but I wasn't able to figure out how to do tests through authentication, so it is not included in this project._

### Versioning
_I wasn't planning on doing this because I had been looking up gems to use for this, but it turns out rudimentary versioning is entirely namespacing and just a slight adjustment to the routes. Updating my request specs for everything was not difficult, and I'm pretty sure the specs need to be versioned to account for the differences in paths between versions._

## Known Bugs

_You are unable to search for both name and species, although you can paginate either search. Trying to search for both only searches for species._

## License - [MIT](https://opensource.org/licenses/MIT)

_If you run into any problems/bugs feel free to send me an email [(mc.casperson@gmail.com)](mailto:mc.casperson@gmail.com) with details._

Copyright (c) _2022 Matt C._