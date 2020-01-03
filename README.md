# Apartments Search

### Ruby version: 2.6.5

### Rails version: 6.0.2

Tech Stack:

- back end: `Ruby On Rails`
- front end: `ReactJS`, `HTML`, `CSS`
- database: `Postgres`
- search engine: `Ransack`
- serialization: `Active Model Serializers`
- geolocation: `Geocoder`
- tests: `Rspec`, `Capybara`, `FactoryBot`
- fake data generation: `FFaker`
- images: `ActiveStorage`, `Aws SDK S3`

**DEMO** app is up and running on Heroku:
https://apartments-search.herokuapp.com/

_Before setting up the database, you can have a look into seeds file and if needed on [line 61](https://github.com/dimon-k/apartments_search/blob/master/db/seeds.rb#L61) change the amount of fake apartments that are going to be generated locally on your machine. By default it's **3000**._

Make sure you have installed and running locally **Elasticsearch 5.x** on **localhost:9200**.

Make sure you have installed and running locally Postgres. Using Brew you can do it by running:

```
brew install postgresql
brew services start postgresql
```

To setup the app, run:

```
rails db:setup
```

To start the app, run:

```
bundle exec rails server
```

To access, visit:
http://localhost:3000/

To run tests, run:

```
bundle exec rspec spec
```
