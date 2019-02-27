# League Of Legends Champions
![travis](https://travis-ci.com/TimothyFell/lol_champs.svg?branch=master)
![Heroku](https://heroku-badge.herokuapp.com/?app=heroku-badge)

## Description

This is a small app that allows users to read through the stats of all of the League of Legends Champions. They can also favorite the champions to view them one screen to compare some of the basic stats and keep a running list of favorites. I used the champion data from Fantasy Data API to seed my database at first and on production have a rake task that updates the database every day at midnight.

## Setup

1. Clone down the repo:

` $ git clone git@github.com:TimothyFell/lol_champs.git blol_champs`

2. Run:

` $ bundle install # Installs dependencies`

3. Setup the database:

` $ rails db:{create,migrate} # Creates and builds the postgresql databases`


## Contributions

If you'd like to contribute to this project, fork this repository then follow the installation instructions below. Once you've finished the feature or fixes you wish to contribute, send us a pull request and one of us will review it before merging. If we have any suggestions, comments or questions we will leave them as comments on you pull request. Thank you in advance.

## Testing

To run the tests locally run the following command:

` $ bundle exec rspec`

## API Calls

The only API call I make in this project is in my rake task. If you want to duplicate the functionality you will need to visit [Fantasy Data](https://developer.fantasydata.com) and request and API key for their LOL endpoints. Once you do, follow these steps.

1. Install Figaro files

` $ bundle exec figaro install # creates figaro files`

2. In the `application.yml` file that just got created, add the following:

````ruby
  FANTASY_DATA_API_KEY: your_brand_new_api_key
````

## Database Schema

This is a simple database where users and champions are joined by a favorites table to reduce data duplication.

![Schema Diagram](./Schema-V1.png)
